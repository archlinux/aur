# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=subsurface
pkgver=5.0.3
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
sha512sums=('79049d2bb31ec6ebf4580a51bf249a97f57c2a1e340804fabeb7a453e14d18594d8938b7eab349fb0bdb194caf6c207315edcd1128085591d6a7d05d0bbcd20b')
b2sums=('a3fc4be21e5055db68d6969781a8592bd461f8aa02130c9c29276d8046dac272616e8f19e298eeb24911f338bdce03e06eb0ea1d7b0cabb3948f30f8c28e51da')

# qt5-webkit still used for: printing, manual

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBDIVECOMPUTER_INCLUDE_DIR=/usr/include/libdivecomputer \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
