pkgname=oacapture-git
pkgver=bb7f8e6
pkgrel=1
pkgdesc="A planetary imaging application using Qt5"
provides=("oacapture")
conflicts=("oacapture")
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt5-base' 'qt5-tools' 'cfitsio' 'autoconf-archive' 'sdl' 'libdc1394')
url="http://www.openastroproject.org/oacapture/"
optdepends=('fxload: support for QHY5 cameras')

source=("openastro-$pkgver::git+https://github.com/openastroproject/openastro#commit=${pkgver}")
sha256sums=("SKIP")

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
