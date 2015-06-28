# Maintainer: aksr <aksr at t-com dot me>
pkgname=sudoku-git
pkgver=v1.0.r2.g2489c02
pkgrel=4
epoch=
pkgdesc="Fancy, feature-complete, cross-platform Sudoku app written in C++/Qt."
arch=('i686' 'x86_64')
url="https://github.com/wimleers/sudoku"
license=('custom:UNLICENSE')
groups=()
depends=('qt4')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('sudoku')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://github.com/wimleers/sudoku.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/$pkgname/src"
  qmake-qt4 Sudoku_release.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 src/Sudoku $pkgdir/usr/bin/Sudoku
  install -Dm644 UNLICENSE $pkgdir/usr/share/licenses/$pkgname/UNLICENSE
}

