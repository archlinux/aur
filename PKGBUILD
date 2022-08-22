# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=vtm
pkgname="$_pkgname"-git
pkgver=0.8.0.r0.g253d039
pkgrel=1
pkgdesc="Terminal multiplexer with window manager and session sharing"
arch=('i686' 'x86_64')
url="https://github.com/netxs-group/$_pkgname"
license=('MIT')
depends=()
makedepends=(git cmake)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	cmake -B build -DCMAKE_INSTALL_PREFIX="/usr" ./src
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
