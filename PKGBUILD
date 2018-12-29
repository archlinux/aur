# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
pkgname=glabels-qt-git
pkgver=r474.c2d024f
pkgrel=1
pkgdesc="Development version of the next major version of gLabels (4.0)."
arch=('x86_64')
url="https://github.com/jimevins/glabels-qt"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-translations')
makedepends=('qt5-tools' 'git' 'cmake' 'zint')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/jimevins/glabels-qt.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd build
	make DESTDIR="$pkgdir/" install
}
