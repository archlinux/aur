# Maintainer: oakszyjrnrdy <oakszyjrnrdy at outlook dot com>
_pkgname="chicony-ir-toggle"
pkgname="$_pkgname-git"
pkgver=r12.ed296dd
pkgrel=1
pkgdesc="A controller for IR emitters of howdy enabled IR cameras"
arch=("x86_64")
url="https://github.com/PetePriority/$_pkgname"
license=('MIT')
makedepends=(
	"git"
	"cmake"
	)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's#/lib#/usr/lib#' "CMakeLists.txt"
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="/usr/" ..
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "build"
	make DESTDIR="$pkgdir/" install
}
