# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=1.1.2
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
sha512sums=('1072e003ded07d4985b24052d79348e9eecaf0223e3d1f44d96a13de3292aa33489ce136b0cedaa4d6d37533232ba691d048eefc579a23085b32e0473114f757'
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
