# Maintainer:
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=cromfs
pkgver=1.5.10.2
pkgrel=3
arch=('x86_64')
pkgdesc='Compressed read-only filesystem based on FUSE'
url='http://bisqwit.iki.fi/source/cromfs.html'
license=('GPL')
depends=('fuse2' 'lzo' 'gcc-libs')
options=('!makeflags')
source=("http://bisqwit.iki.fi/src/arch/${pkgname}-${pkgver}.tar.gz"
        'make-generic.patch')
sha256sums=('26d513eb14f3c75939e49ad9e212556a9580af3ac82640dffd64d32b6b654def'
            '92dc71c3830583abf600c20afce6edf3ad933aeb6f60d5417d04e5376654d5fc')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../make-generic.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}"/usr/{bin,share/doc/cromfs}
	install -m755 install/progs/* "${pkgdir}"/usr/bin/
	install -m644 install/docs/* "${pkgdir}"/usr/share/doc/cromfs/
}
