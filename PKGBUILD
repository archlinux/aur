# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=subsurface
pkgver=5.0.6
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
sha256sums=('244a03e3b38a278686d0c8ba0eced51d93bc9d16021079ed0ec2e475f0109ee2')

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
