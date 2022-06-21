# Maintainer: Hikari Hayashi <rev.hikari@gmail.com>

pkgname=figma-agent-linux
pkgver=0.2.0
pkgrel=1
pkgdesc="Figma Agent for Linux"
url="https://github.com/neetly/figma-agent-linux"
license=(MIT)
arch=(x86_64 aarch64)
depends=(freetype2 fontconfig)
makedepends=(git rust)
source=("$pkgname::git+https://github.com/neetly/figma-agent-linux.git#tag=v$pkgver")
cksums=(SKIP)

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "./target/$CARCH-unknown-linux-gnu/release/figma-agent" "$pkgdir/usr/bin/figma-agent"
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/figma-agent/LICENSE"
  install -Dm644 "./figma-agent.service" "$pkgdir/usr/lib/systemd/user/figma-agent.service"
}
