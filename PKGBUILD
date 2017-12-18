# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Rolf Pfeffertal <notthispart tropf at posteo thispartneither dot de>
pkgname=tmines
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="terminal minesweeper clone"
arch=('i686' 'x86_64')
url="https://github.com/tropf/tmines"
license=('MIT')
groups=()
depends=('ncurses')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=('tmines') # doesn't exist currently
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/tropf/tmines.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	cmake -Dbuild_tests=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr "$srcdir/tmines"
	make -j2
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

