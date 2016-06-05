# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation-git
pkgver=r778.1601ab1
pkgrel=1
pkgdesc="Drive your FRC robot with your phone or tablet!"
arch=('i686' 'x86_64')
url="https://github.com/wint-3794/qdriverstation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-multimedia')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('qdriverstation::git+https://github.com/WinT-3794/QDriverStation.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake-qt5
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
