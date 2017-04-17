# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
pkgname=razergenie
pkgver=0.1
pkgrel=1
pkgdesc="Standalone Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'kconfigwidgets' 'kwidgetsaddons' 'hicolor-icon-theme' 'razer-daemon')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/z3ntu/RazerGenie/archive/v$pkgver.tar.gz")
sha512sums=('1fe0d0e0ca3312da7c0767e42fd65d88c825724459478e5c11137de26dd536fa986c0e58f2a9c848c783b539611682a139ee4e51062972b5cb23d83eb431c1fa')

build() {
  cd $srcdir/$_upstream-$pkgver
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd $srcdir/$_upstream-$pkgver/build
  make DESTDIR="$pkgdir/" install
}
