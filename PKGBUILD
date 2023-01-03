# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Exposing MPRIS V2.1 D-Bus interface for mpd" 
arch=(x86_64)
url="https://github.com/szclsya/mpdris2-rs"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szclsya/$pkgname/archive/$pkgver.tar.gz"
        "mpdris2-rs.service")
sha512sums=('aba74d1ca5044343a576e97ac5a784ef4fa9e82a5987f4b5729293922c64403860aed85a85368cf5c13c3b11e5ef6bffd9572f366f856bc28e0c8a03ebb6f1d5'
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
