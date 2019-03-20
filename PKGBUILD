pkgname=oacapture
pkgver=1.5.0
pkgrel=2
pkgdesc="A planetary imaging application using Qt5"
provides=("oacapture")
conflicts=("oacapture-git")
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt5-base' 'qt5-tools' 'cfitsio' 'autoconf-archive' 'sdl' 'libdc1394')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')

source=("https://github.com/openastroproject/openastro/archive/v${pkgver}.tar.gz")
sha256sums=("1b3fc328cfa9e64ef6c5f51d2aa17196f636f8171a15e916f322a0875114bc31")

build() {
	cd "openastro-${pkgver}"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "openastro-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# remove unwanted files
	rm -rf ${pkgdir}/usr/include
	rm -rf ${pkgdir}/usr/lib/*.a
	rm -rf ${pkgdir}/usr/lib/pkgconfig
	rm -rf ${pkgdir}/usr/share/doc/hidapi
}
