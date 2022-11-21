# Maintainer: trickybestia <trickybestia@gmail.com>

pkgname=linux-discord-rich-presence
pkgver=3.1.3
pkgrel=1
pkgdesc="Customizable Discord Rich Presence client for Linux"
arch=(x86_64)
url=https://github.com/trickybestia/linux-discord-rich-presence
license=(GPL3)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(7a5cbecf75f38848e67b742941ccd9a403f2b9d1d3c23211d8cf90c76fb07afb)

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

  install -Dm0755 -t "$pkgdir/usr/bin/" "./target/release/linux-discord-rich-presence"
  install -Dm0755 -t "$pkgdir/usr/bin/" "./doc/linux-discord-rich-presence-desktop-wrapper"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "./doc/linux-discord-rich-presence.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "./doc/linux-discord-rich-presence-minimized.desktop"
}
