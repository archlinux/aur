# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dfc
pkgver=3.0.5
_magic_download_extra=467
pkgrel=1
pkgdesc='Display file system space usage using graphs and colors'
arch=('x86_64' 'i686')
url='http://projects.gw-computing.net/projects/dfc'
license=('BSD')
makedepends=('cmake' 'gettext')
source=("http://projects.gw-computing.net/attachments/download/${_magic_download_extra}/${pkgname}-${pkgver}.tar.gz")
install='dfc.install'
sha256sums=('3c947a1d6bc53347b1643921dcbf4c6f8fe7eb6167fc1f4e9436366f036d857a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . \
		-DPREFIX=/usr \
		-DSYSCONFDIR=/etc \
		-DCMAKE_BUILD_TYPE=RELEASE
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

