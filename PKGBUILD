# Maintainer: BrLi <brli@chakralinux.org>
_pkgname=plugin-wingmenu
pkgname=lxqt-$_pkgname-git
pkgver=r29.5609864
pkgrel=1
pkgdesc="alternative menu plugin for lxqt-panel"
arch=(x86_64)
url="https://github.com/slidinghotdog/plugin-wingmenu"
license=('GPL')
groups=(lxqt)
depends=(liblxqt lxqt-panel)
makedepends=(lxqt-build-tools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -B build -S .
	cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" cmake --install build
}
