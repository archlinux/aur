# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=msieve
pkgver=1.53
pkgrel=1
pkgdesc='Library for factoring large integers'
url='http://sourceforge.net/projects/msieve/'
license=('custom')
arch=('x86_64')
depends=('zlib' 'gmp-ecm')
source=("http://downloads.sourceforge.net/project/msieve/msieve/Msieve%20v${pkgver}/msieve${pkgver/./}_src.tar.gz")
sha1sums=('6ecd72c5f86288edbad111415dbcc03b6c35b524')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed \
		-e 's/^CFLAGS =/CFLAGS +=/' \
		-i Makefile
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CFLAGS+=' -fopenmp'
	make all ECM=1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 msieve "${pkgdir}"/usr/bin/msieve
	install -Dm544 Readme "${pkgdir}"/usr/share/doc/msieve/Readme
	install -d "${pkgdir}"/usr/share/licenses/msieve; ln -s /usr/share/doc/msieve/Readme "${pkgdir}"/usr/share/licenses/msieve/Readme
}
