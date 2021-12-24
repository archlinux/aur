# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
pkgname=coeurl
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple async wrapper around CURL for C++"
arch=("x86_64")
url="https://nheko.im/nheko-reborn/coeurl"
license=('MIT')
depends=("curl" "libevent" "spdlog")
makedepends=("meson")
source=("https://nheko.im/nheko-reborn/coeurl/-/archive/v$pkgver/coeurl-v$pkgver.tar.gz")
sha256sums=('e79becfc80b20ee8377e4282463ca2337df5a7b3f2f64b304a88ccd0128bef06')

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
