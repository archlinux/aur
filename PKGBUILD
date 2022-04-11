# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=copycat
pkgname="$_pkgname"-git
pkgver=0.1.r0.gfeda396
pkgrel=1
pkgdesc="A library for intercepting system calls"
arch=('i686' 'x86_64')
url="https://github.com/vimpostor/$_pkgname"
license=('GPL3')
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
	cmake -B build -DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
