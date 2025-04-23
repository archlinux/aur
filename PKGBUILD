# Maintainer: trickybestia <trickybestia@gmail.com>

pkgname=linux-discord-rich-presence
pkgver=3.2.2
pkgrel=1
pkgdesc="Customizable Discord Rich Presence client for Linux"
arch=(x86_64)
url=https://github.com/trickybestia/linux-discord-rich-presence
license=(GPL3)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(b3c59e65d8ff9b0be606e8f732c5f1c4f59844f6f5aa26214a1739f0109b5a54)

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
