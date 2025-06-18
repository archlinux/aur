# Maintainer: link2xt <link2xt@testrun.org>
pkgname=deltatouch-git
pkgver=r522.ae53cb2
pkgrel=1
pkgdesc="Delta Chat client using Lomiri UI toolkit"
arch=(x86_64)
url="https://codeberg.org/lk108/deltatouch"
license=('GPL-3.0-or-later')
groups=()
depends=(lomiri-ui-toolkit quirc)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
#source=(git+https://codeberg.org/lk108/deltatouch.git#commit=73f0e72d763de4af2d8f0f91ff86d3ce39dfe6b3)

# Using fork from <https://codeberg.org/lk108/deltatouch/pulls/40> that has full CMake support
source=(git+https://codeberg.org/d2weber/deltatouch.git#commit=ae53cb21d1a835aa9be88cb36c8a438b6731cb4b)
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cmake -B build -S "${pkgname%-git}" -W no-dev -D CMAKE_BUILD_TYPE=None -D CMAKE_INSTALL_PREFIX=/usr
}

build() {
	cd "$srcdir"
	cmake --build build
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
