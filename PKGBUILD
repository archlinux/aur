# Maintainer: Philip Johansson <philipphuket at gmail dotcom>
pkgname=tuidoku-git
_pkgname=tuidoku
pkgver=r146.df126ee
pkgrel=1
pkgdesc="Play, solve and generate sudoku puzzles in the console"
arch=('x86_64')
url="https://github.com/flyingpeakock/tuidoku"
license=('MIT')
depends=(ncurses git)
makedepends=(gcc)
provides=("tuidoku")
replaces=("console_sudoku")
source=("git+https://github.com/flyingpeakock/tuidoku.git")
noextract=("${source[@]##*/}")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"
        g++ -O3 -pthread ./Console_sudoku/src/*.cpp -lncursesw -o console_sudoku
}

package() {
        cd "$srcdir"
        install -Dm755 console_sudoku $pkgdir/usr/bin/console_sudoku
        install -Dm644 ./Console_sudoku/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
