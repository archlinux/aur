# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=colm-git
pkgver=0.14.7.r0.ge88bda06
pkgrel=1
pkgdesc="A programming language designed for the analysis and transformation of computer languages"
arch=('i686' 'x86_64')
url="https://www.colm.net/open-source/colm/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'asciidoc' 'fig2dev')
provides=('colm')
conflicts=('colm')
options=('staticlibs')
source=("git+https://github.com/adrian-thurston/colm.git")
sha256sums=('SKIP')


pkgver() {
  cd "colm"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "colm"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --datadir="/usr/share/colm"
  make
}

check() {
  cd "colm"

  make check
}

package() {
  cd "colm"

  make DESTDIR="$pkgdir" install
  install -Dm644 "colm.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/colm"
}
