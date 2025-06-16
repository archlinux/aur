# Maintainer: Leo Shen <i@szclsya.me>
pkgname=mpdris2-rs
pkgver=1.0.0
_pkgver=1.0.0
pkgrel=0
pkgdesc="Exposing MPRIS V2.1 D-Bus interface for mpd" 
arch=(x86_64)
url="https://github.com/szclsya/mpdris2-rs"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/szclsya/$pkgname/archive/$_pkgver.tar.gz"
        "mpdris2-rs.service")
sha512sums=('b046c14426a875e39ddcc0687c7e7b5ef68a787f127ab9b5cc335d6120a403ff795fea6cab4045be5b2caa1b0f0d4501c4ed17516f1a1c85f11807ec4c3dc988'
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
