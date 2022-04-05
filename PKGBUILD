# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=subsurface
pkgver=5.0.8
pkgrel=1
pkgdesc='Divelog program'
url='https://github.com/subsurface/subsurface'
license=('GPL2')
arch=('x86_64')
depends=(
	'googlemaps' ## AUR
	'grantlee'
	'hicolor-icon-theme'
	'libgit2.so'
	'libzip'
	'libxml2'
	'libxslt'
	'subsurface-libdc' ## AUR
	'qt5-svg'
	'qt5-location'
	'qt5-connectivity'
	'qt5-webkit'
	'sqlite')
makedepends=(
	'asciidoc'
	'cmake'
	'libgit2'
	'libusb'
	'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d2d2e219a4d23115a5694cd721a5379b32f8375e42381c90c811db62dbafec12')

PURGE_TARGETS=(*.debug)

# qt5-webkit still used for: printing, manual

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBDIVECOMPUTER_INCLUDE_DIR=/usr/include/libdivecomputer \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
