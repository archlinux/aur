# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
_pkgname=razergenie
pkgname=razergenie-git
pkgver=0.2.r13.g209d132
pkgrel=1
pkgdesc="Standalone Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'razer-daemon')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/RazerGenie.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_upstream
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_upstream -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
