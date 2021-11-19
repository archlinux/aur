# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
pkgname=coeurl
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple async wrapper around CURL for C++"
arch=("x86_64")
url="https://nheko.im/nheko-reborn/coeurl"
license=('MIT')
depends=("curl" "libevent" "spdlog")
makedepends=("meson")
source=("https://nheko.im/nheko-reborn/coeurl/-/archive/v$pkgver/coeurl-v$pkgver.tar.gz")
sha256sums=('2861453317c6da359a00083e39d899dfe0fc71becadd726ef845a5fba57d3f64')

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
