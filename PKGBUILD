# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="Exposing MPRIS V2.1 D-Bus interface for mpd" 
arch=(x86_64)
url="https://github.com/szclsya/mpdris2-rs"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szclsya/$pkgname/archive/$pkgver.tar.gz"
        "mpdris2-rs.service")
sha512sums=('f3e7b1eb0aca3ac38a477fd87f01f25224ca9fd2dd45f2d463e6dd50727e5eb4723d21f531365687596e499de303424e9471a388ee1c9795a38df69d08755375'
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
