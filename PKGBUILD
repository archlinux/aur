# Maintainer: Hikari Hayashi <rev.hikari@gmail.com>

pkgname=figma-agent-linux
pkgver=0.2.3
pkgrel=1
pkgdesc="Figma Agent for Linux (a.k.a. Font Helper)"
url="https://github.com/neetly/figma-agent-linux"
license=(MIT)
arch=(x86_64 aarch64)
depends=(freetype2 fontconfig)
makedepends=(git rust clang)
source=("$pkgname::git+https://github.com/neetly/figma-agent-linux.git#tag=$pkgver")
cksums=(SKIP)
install=figma-agent.install

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "./target/$CARCH-unknown-linux-gnu/release/figma-agent" "$pkgdir/usr/bin/figma-agent"
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/figma-agent/LICENSE"
  install -Dm644 "./figma-agent.service" "$pkgdir/usr/lib/systemd/user/figma-agent.service"
}
