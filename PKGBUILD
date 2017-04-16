# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
_pkgname=razergenie
pkgname=razergenie-git
pkgver=r42.41b61b5
pkgrel=1
pkgdesc=""
arch=("x86_64" "i686")
url=""
license=('GPL3')
depends=('qt5-base' 'kconfigwidgets' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/RazerGenie.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_upstream
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_upstream
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd $srcdir/$_upstream/build
  make DESTDIR="$pkgdir/" install
}
