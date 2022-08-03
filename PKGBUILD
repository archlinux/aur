# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: 2ion <dev@2ion.de>

pkgname=uchardet-git
_pkgname="${pkgname%-git}"
pkgver=0.0.7.r11.g143b3fe
pkgrel=1
pkgdesc="Encoding detector library ported from Mozilla"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/software/uchardet"
license=('MPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("$_pkgname" 'libuchardet.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitlab.freedesktop.org/uchardet/uchardet")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

package() {
	make DESTDIR="$pkgdir" -C build install
}
