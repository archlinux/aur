# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
pkgname=razergenie
pkgver=0.8
pkgrel=1
pkgdesc="Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'openrazer-daemon')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/RazerGenie-$pkgver.tar.xz"{,.asc})
sha512sums=('2d8f2b3bfdfc175e525316ae6d63762bc9b96538df02976341cbd893c54d11a8cb56e6449754af114333b83b38e0dfd78eedd0a4bdd697b91e467e86566f6272'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "$_upstream-$pkgver" build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
