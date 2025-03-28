# Maintainer: envolution
# Contributor: Tony Benoy <me@tonybenoy.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=screenpipe
pkgver=0.2.74
pkgrel=1
pkgdesc="24/7 Screen and Audio Capture with AI-powered tools"
arch=('x86_64')
url="https://github.com/mediar-ai/screenpipe"
license=('MIT')
depends=('onnxruntime' 'ffmpeg' 'tesseract' 'curl' 'libxi' 'libxtst' 'xdo' 'xdotool')
makedepends=('rust' 'cargo' 'git' 'cmake')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mediar-ai/screenpipe/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('64b0c66060e1acbb9544218411a99aebeb1133f918cdd6da3e7d6ed838a96f14')
options=(!lto !debug)

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly #stable no longer supported
  cargo fetch --target "x86_64-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/screenpipe" "$pkgdir/usr/bin/screenpipe"
  install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
# vim:set ts=2 sw=2 et:
