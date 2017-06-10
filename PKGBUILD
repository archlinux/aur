#Maintainer : Sasasu <lizhaolong0123@gmail.com>
pkgname=iaito-git
pkgver=r266.d033b52
pkgrel=1
_gitname=iaito
pkgdesc="A Qt and C++ GUI for radare2 reverse engineering framework"
arch=('x86_64')
url="https://github.com/hteso/iaito"
license=('GPL3')
depends=('qt5-base' 'qt5-webengine' 'radare2')
makedepends=('gcc' 'git')
source=('git://github.com/hteso/iaito')
md5sums=('SKIP')
pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$srcdir/iaito"
  mkdir build ; cd build
  qmake PREFIX=/usr APPIMAGE=1 ../src
  make
}
package() {
  cd "$srcdir/iaito"
  cd build
  make INSTALL_ROOT="$pkgdir/" install
}
