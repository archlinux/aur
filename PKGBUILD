# Maintainer: SaltedFish
# This is made by storycraft (Github) so all credit goes to them. I (SaltedFish) am just uploading it to AUR. My reddit is u/Salted_Fsh
pkgname=xp3-tool
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple tool for packing and unpacking .xp3 files"
arch=('x86_64')
url="https://github.com/storycraft/xp3-tool"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('694df2a19d78ca990d1ef90b94d3dec07e365684e1339f57a30b3bf3a5dbdd10')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/xp3-packer" "$pkgdir/usr/bin/xp3-packer"
  install -Dm755 "target/release/xp3-unpacker" "$pkgdir/usr/bin/xp3-unpacker"
}
