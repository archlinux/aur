# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=0.1.3
pkgrel=0
pkgdesc="Exposing MPRIS V2.1 D-Bus interface for mpd" 
arch=(x86_64)
url="https://github.com/szclsya/mpdris2-rs"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szclsya/$pkgname/archive/$pkgver.tar.gz"
        "mpdris2-rs.service")
sha512sums=('af76f1f4244c154b2b607e59f20b55d82094722c306c8ac2ece1c7ad47cdba98635dd310c1db00faa2f3a279084f1740d493e2246854ba8a86931a6fc2bdc97a'
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
