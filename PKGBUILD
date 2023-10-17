# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=0.2.1
pkgrel=0
pkgdesc="Exposing MPRIS V2.1 D-Bus interface for mpd" 
arch=(x86_64)
url="https://github.com/szclsya/mpdris2-rs"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szclsya/$pkgname/archive/$pkgver.tar.gz"
        "mpdris2-rs.service")
sha512sums=('94708bced9e31373956ae3fa3940b365c3b811366404fff8a1696c7d31638b40a28f64b5b613e1924745d1caf287ad8d88595fdb6ec5e8273299ee8493f6ff8f'
           'SKIP')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/mpdris2-rs" "$pkgdir/usr/bin/mpdris2-rs"
  install -Dm644 "mpdris2-rs.service" "$pkgdir/usr/lib/systemd/user/mpdris2-rs.service"
  install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
