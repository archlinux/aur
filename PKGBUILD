# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=gitoxide
pkgver=0.17.0
pkgrel=1
pkgdesc="A command-line application for interacting with git repositories"
url="https://github.com/Byron/gitoxide"
license=('Apache' 'MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Byron/gitoxide/archive/refs/tags/v$pkgver.tar.gz")
cksums=('3158530872')
sha256sums=('5fc97535f1bb7f5ad6668b5a3584b55dd4a83f7407aca2ef04ec418c4e9c11fe')
b2sums=('e3aca674e6f28b7773ebdb8f2085510e6eb8df68c7c24f789e41aea985f0550a7f369e7635da49e4fa2e3543f661824459967890cbfc4be6405e25aa74dd61cc')

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
