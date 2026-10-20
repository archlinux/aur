# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=all-the-platforms
pkgver=0.3.0
pkgrel=1
pkgdesc="One command for all the platforms: read, search, post, chat and download on 67 platforms, with JSON output and an MCP server"
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/atp"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'rust' 'cmake' 'clang')
optdepends=(
  'ffmpeg: merge video and audio, audio-only downloads'
  'chromium: pass human checks in a browser (or google-chrome, microsoft-edge, brave)'
)
conflicts=('all-the-platforms-git' 'all-the-platforms-bin' 'atp-bin')
options=('!lto')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/atp" "$pkgdir/usr/bin/atp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "README.zh-CN.md" "$pkgdir/usr/share/doc/$pkgname/README.zh-CN.md"
}
