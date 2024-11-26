# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=1.0.0beta.1
_pkgver=1.0.0-beta.1
pkgrel=0
pkgdesc="Exposing MPRIS V2.1 D-Bus interface for mpd" 
arch=(x86_64)
url="https://github.com/szclsya/mpdris2-rs"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szclsya/$pkgname/archive/$_pkgver.tar.gz"
        "mpdris2-rs.service")
sha512sums=('dff8c540c7fa303bbe288568ed87eebd1e34584ea09ccc571ed8ca64eca46280f9ec8222364e1706f87ac35edc12834f88ee2bad8fdaf4ec2838f135ba9ff40d'
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
