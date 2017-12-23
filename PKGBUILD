# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
pkgname=razergenie
pkgver=0.6
pkgrel=1
pkgdesc="Standalone Qt application for configuring your Razer devices under GNU/Linux."
arch=("x86_64" "i686")
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('qt5-base' 'openrazer-daemon')
makedepends=('meson' 'qt5-tools')
source=("https://github.com/z3ntu/RazerGenie/releases/download/v$pkgver/RazerGenie-$pkgver.tar.xz"{,.asc})
sha512sums=('02bb533c2d4bb19bd6b8d5f1440699cbd0aaab32081af3b884365b8ab5149b6d33f3b2835e4e41f61e33b76e1c03018968addfa7889f8a3f9d3d205ac1bd32f2'
            'SKIP')
validpgpkeys=('BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD') # Luca Weiss

build() {
  arch-meson "$_upstream-$pkgver" build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
