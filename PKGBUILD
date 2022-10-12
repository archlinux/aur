# Maintainer: trickybestia <trickybestia@gmail.com>

pkgname=linux-discord-rich-presence
pkgver=3.1.2
pkgrel=1
pkgdesc="Customizable Discord Rich Presence client for Linux"
arch=(x86_64)
url=https://github.com/trickybestia/linux-discord-rich-presence
license=(GPL3)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(4144a4bdb766ae3721dbf8cac6b4b66ebb8305426b7f0625fae08de96f5ce794)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "./target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "./doc/$pkgname.desktop"
}
