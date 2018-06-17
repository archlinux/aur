# Maintainer: npmiller <aur@npmiller.fr>
_pkgname=qtwilist
pkgname=$_pkgname-git
pkgver=1
pkgrel=1
pkgdesc="List twitch streamers"
arch=("x86_64")
license=("GPL3")
depends=("qt5-base" "streamlink" "hicolor-icon-theme")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/npmiller/qtwilist.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p build
	cd build

	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
