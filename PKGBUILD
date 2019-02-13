# Maintainer: Peter Taylot <info at emersont1 dot co dot uk>

pkgname=chesspp-git
pkgver=0.0.1
pkgrel=3
pkgdesc="a swiss chess algorithm implementation, using an SQLITE database"
arch=('x86_64' 'i686')
license=('MIT')
url="https://gitlab.com/Emersont1/chesspp"
depends=('ncurses')
makedepends=('git' 'cmake' 'ninja')
source=('chesspp-git::git+https://gitlab.com/Emersont1/chesspp.git#branch=master')
md5sums=('SKIP')
#install=robco-terminal.install

build() {
# don't think i need to do anything
mkdir $PWD/$pkgname/build
cd $PWD/$pkgname/build
cmake ..
make header_gen
./tools/headergen/header_gen -f ../chesslib/game.sql
make -j$(nproc)
#ls .
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {

  mkdir -p $pkgdir/usr/include
  cp -r $PWD/$pkgname/chesslib/include/* $pkgdir/usr/include

  mkdir -p $pkgdir/usr/lib
  cp -r $PWD/$pkgname/build/chesslib/libchesspp.a $pkgdir/usr/lib

  mkdir -p $pkgdir/usr/bin
  cp -r $PWD/$pkgname/build/main_program/chess $pkgdir/usr/bin
}
