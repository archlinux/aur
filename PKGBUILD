# Maintainer: James Clarke <james@jamesdavidclarke.com>
pkgname=libappanvil-git
pkgver=r1357.c6ed7591
pkgrel=1
pkgdesc="A library for AppAnvil, a graphical user interface for the AppArmor security module"
arch=('x86_64')
url="https://github.com/jack-ullery/libappanvil"
license=('GPL')
makedepends=('git' 'pkgconf' 'cmake' 'clang' 'bison' 'flex')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libappanvil"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/libappanvil"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .. 
}

package() {
  cd "$srcdir/libappanvil/build"
  make DESTDIR="$pkgdir/" install
}
