# Maintainer: link2xt <link2xt@testrun.org>
pkgname=deltatouch-git
pkgver=r524.e4f3924
pkgrel=1
pkgdesc="Delta Chat client using Lomiri UI toolkit"
arch=(x86_64)
url="https://codeberg.org/lk108/deltatouch"
license=('GPL-3.0-or-later')
groups=()
depends=(lomiri-ui-toolkit quirc qt5-quickcontrols2 qt5-webengine qt5-multimedia libdeltachat qt5-pim)
makedepends=(git cmake intltool)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(git+https://codeberg.org/lk108/deltatouch.git#commit=e4f39241844c4b8ecd1fb396fd9ab01111a2aa55)
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
