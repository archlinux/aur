# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=libcprime-git
_pkg="${pkgname%-git}"
pkgver=4.4.1.r0.g21750d2
pkgrel=1
pkgdesc="A library for bookmarking, saving recent activites, managing settings of C-Suite"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/libcprime"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'git')
provides=("$_pkg" "$_pkg-core.so" "$_pkg-gui.so" "$_pkg-widgets.so")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$_pkg" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
