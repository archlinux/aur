# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=1.1.1
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
sha512sums=('3816c62eee8aed764aa5d9630f4e34cfa50fce21b4b62c50d0ef5d60302bf8ca3270046a7afa1b8a4062c381951cff091227ab6c05b4161671e72d26f5d43c21'
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
