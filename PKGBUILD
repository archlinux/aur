# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
pkgname=razergenie
pkgver=0.3
pkgrel=1
pkgdesc="Standalone Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme' 'razer-daemon')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/z3ntu/RazerGenie/archive/v$pkgver.tar.gz"
        "https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha512sums=('46cd1d8365e4aa90f057fa34e319fcb115ea96255cc42be1fc48e047f63e780ec8ecce3689b6855d41583900139179474240e978fe3af0ceb706f02df15ba39d'
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
