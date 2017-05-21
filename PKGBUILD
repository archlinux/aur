# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
pkgname=razergenie
pkgver=0.2
pkgrel=1
pkgdesc="Standalone Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'kconfigwidgets' 'kwidgetsaddons' 'hicolor-icon-theme' 'razer-daemon')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/z3ntu/RazerGenie/archive/v$pkgver.tar.gz"
        "https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha512sums=('6691f03ccf6793d5f5086ed0be6049f0674fd02ff51ece0955be1aeb2bc90014b67c98404596626614991fedb5b6e360f69193853a7b51607bf45a5f4393335e'
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
