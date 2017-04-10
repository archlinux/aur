# Maintainer: Johannes Larsen <mail at johslarsen dot net>

pkgname="quickstack-git"
pkgver=0.r17.844fd47
pkgrel=1
pkgdesc="quickstack is a tool to take call stack traces with minimal overheads."
arch=('i686' 'x86_64')
url="https://github.com/yoshinorim/quickstack"
license=('BSD')
depends=('binutils' 'libelf' 'gcc')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/yoshinorim/quickstack")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  cmake .
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="${pkgdir}/" install
  install -Dm644 licenses/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
