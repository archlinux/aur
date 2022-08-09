# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=fftune
pkgname="$_pkgname"-git
pkgver=1.0.r0.gcfd0b9f
pkgrel=1
pkgdesc="A modern pitch detection library"
arch=('i686' 'x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('LGPL3')
depends=(fftw libsmf libsndfile sfizz)
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
