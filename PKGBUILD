# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=gitoxide
pkgver=0.16.0
pkgrel=1
pkgdesc="A command-line application for interacting with git repositories"
url="https://github.com/Byron/gitoxide"
license=('Apache' 'MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Byron/gitoxide/archive/refs/tags/v$pkgver.tar.gz")
cksums=('611980456')
sha256sums=('f366897f3b8952b538694f76a814c687f6b9b1fa57b549a3d4b64eba3ae88c57')
b2sums=('8f4222aac513425b5f92d7497112acfa1d4fb8c2c75260563606c2cada44e4960fe6e31a1acd9d72a3e8ceca58105de217e1d3ed52457a72d6fb7831738934c4')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --features 'max'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/gix target/release/ein

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}
