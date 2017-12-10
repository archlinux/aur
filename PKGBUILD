# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=fparser-git
pkgver=r10.a59e1f5
pkgrel=1
pkgdesc="Function Parser for C++, Fork from http://warp.povusers.org/FunctionParser/"
url="https://github.com/thliebig/fparser"
arch=('i686' 'x86_64')
license=('LGPL3')
provides=('fparser')
conflicts=('fparser')

source=(git+https://github.com/thliebig/fparser 'fix-libdir.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/fparser"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd fparser
  patch -Np1 -i ../fix-libdir.patch
}

build() {
  cd "$srcdir/fparser" 
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} ../
  make
}

package() {
  cd "$srcdir/fparser/build"
  make install
}
