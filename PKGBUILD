# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
pkgname=coeurl
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple async wrapper around CURL for C++"
arch=("x86_64")
url="https://nheko.im/nheko-reborn/coeurl"
license=('MIT')
depends=("curl" "libevent" "spdlog")
makedepends=("meson")
source=("https://nheko.im/nheko-reborn/coeurl/-/archive/v$pkgver/coeurl-v$pkgver.tar.gz")
sha256sums=('099feb59512fdd321f777547f0d4f1fc3c2d919369330f318b8c36dc646c0764')

build() {
  arch-meson $pkgname-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $pkgname-v$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
