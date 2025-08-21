# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=1.0.2
_pkgver=$pkgver
pkgrel=0
pkgdesc="Exposing MPRIS V2.1 D-Bus interface for mpd" 
arch=(x86_64)
url="https://github.com/szclsya/mpdris2-rs"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szclsya/$pkgname/archive/v$_pkgver.tar.gz"
        "mpdris2-rs.service")
sha512sums=('ccb555578d39e6d0bc7dc8d63c8f87a0cef57aec749834526575a610d70528847d98437f65e98e183b487785b28535a308a791d2df4e27d6ed1bbc3795ebc22b'
           'SKIP')

build() {
  cd "$pkgname-$_pkgver"

  cargo build --release --locked
}

package() {
  install -Dm755 "$pkgname-$_pkgver/target/release/mpdris2-rs" "$pkgdir/usr/bin/mpdris2-rs"
  install -Dm644 "mpdris2-rs.service" "$pkgdir/usr/lib/systemd/user/mpdris2-rs.service"
  install -Dm644 "$pkgname-$_pkgver/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "$pkgname-$_pkgver/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
