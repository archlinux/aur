# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
pkgname=razergenie
pkgver=0.4
pkgrel=1
pkgdesc="Standalone Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'razer-daemon')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/RazerGenie-$pkgver.tar.xz"{,.asc})
sha512sums=('b8ea90f982ed25231c10c7244615c8e6db97cb36a7740ab02855c0c5efdf22c19f8c770f1d51080f8d5d68ff6c212f290fc213bf393baf60517fe622b8b77cc9'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss <luca@z3ntu.xyz>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_upstream-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
