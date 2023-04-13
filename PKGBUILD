# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=readline-git
pkgver=8.2.r1.g7274faa
pkgrel=1
pkgdesc="GNU readline library"
arch=('i686' 'x86_64')
url="https://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('glibc' 'libncursesw.so' 'ncurses')
makedepends=('git')
provides=("readline=$pkgver" 'libhistory.so' 'libreadline.so')
conflicts=('readline')
options=('!emptydirs' 'staticlibs')
source=("git+https://git.savannah.gnu.org/git/readline.git"
        "https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/readline/trunk/inputrc")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "readline"

  git describe --long --tags | sed 's/^readline-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "readline"

  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "readline"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/inputrc" -t "$pkgdir/etc"
}
