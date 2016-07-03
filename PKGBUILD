# Maintainer: Takefumi Nagata <rago1975@users.osdn.me>

_pkgname=qtermwidget-cjk
pkgname=$_pkgname-git
pkgver=r3.ee5d67b
pkgrel=1
pkgdesc="Qtermwidget with supporting characters width in East Asian ambiguous category" 
arch=("i686" "x86_64")
url="https://github.com/rago1975/qtermwidget-cjk"
license=("GPL2")
provides=('qtermwidget')
conflicts=('qtermwidget' 'qtermwidget-git')
depends=("qt5-base")
makedepends=("git" "cmake")
source=("git+https://github.com/rago1975/$_pkgname.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
