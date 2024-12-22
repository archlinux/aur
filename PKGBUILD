# Maintainer: envolution
# Contributor: Tony Benoy <me@tonybenoy.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=screenpipe
pkgver=0.2.20
pkgrel=1
pkgdesc="24/7 Screen and Audio Capture with AI-powered tools"
arch=('x86_64')
url="https://github.com/mediar-ai/screenpipe"
license=('MIT')
depends=('ffmpeg' 'tesseract' 'curl' 'libxi' 'libxtst' 'xdo' 'xdotool')
makedepends=('rust' 'cargo' 'git' 'cmake')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mediar-ai/screenpipe/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('c81e35753f3b6185fd7832f466872b3ff6bd7e793e88d635f5684368a0f8c768')
options=(!lto !debug)

build() {
  cd "$pkgname-$pkgver"
  # Build the application using cargo
  cargo build --release
}

package() {
  # Install the binary
  install -Dm755 "$pkgname-$pkgver/target/release/screenpipe" "$pkgdir/usr/bin/screenpipe"

  # Install additional documentation
  install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
