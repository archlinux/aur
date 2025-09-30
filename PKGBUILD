# Maintainer: Haris Gušić <harisgusic at gmail dot com>

pkgname=alacritty-mcp
pkgver=0.2.0
pkgrel=1
pkgdesc="Model Context Protocol (MCP) server for controlling Alacritty terminal instances"
options=('!debug')
arch=('x86_64')
url="https://github.com/Feel-ix-343/alacritty-mcp"
license=('MIT')
depends=(
  'alacritty'
  'xdotool'
  'xclip'
)
makedepends=(
  'rust'
  'cargo'
  'git'
)
optdepends=(
  'neovim: Neovim context extraction support'
  'imagemagick: Screenshot support'
)
provides=('alacritty-mcp')
conflicts=('alacritty-mcp')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  # Install binary
  install -Dm755 "target/release/alacritty-mcp" "$pkgdir/usr/bin/alacritty-mcp"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
