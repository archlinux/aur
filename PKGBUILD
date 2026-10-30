# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=capsimage
pkgver=5.21
pkgrel=1
pkgdesc="Library to access IPF and CTR files"
arch=('x86_64')
url="https://www.kryoflux.com/"
license=('custom:SPS License')
depends=('gcc-libs')
provides=('libcapsimage.so=5-64')
source=("https://www.kryoflux.com/download/spsdeclib_${pkgver}_source.zip")
sha256sums=('fca645c00c2ec3bda2c8ad8dd94be50ed4bc4e0e0e4a35515e9386f758e466be')

build() {
	cmake -S SPStudio_Dev -B build -D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	
	#fix the symlink that errors our in the line above
	ln -s libCAPSImage.so "${pkgdir}"/usr/lib/libcapsimage.so
}
