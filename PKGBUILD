# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=flip-link
pkgver=0.1.6
pkgrel=1
pkgdesc="Flips the memory layout of embedded programs to protect against stack overflows"
url="https://github.com/knurling-rs/flip-link"
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'aarch64' 'arm')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/knurling-rs/flip-link/archive/refs/tags/v$pkgver.tar.gz")
cksums=('3365300705')
sha256sums=('613373337f34551670f8f6330958e4965de89a17fb3bbf972c3b3c6bfaad4abf')
b2sums=('49e1314da3f14213418203bb8927a2f51b7909b46767494e3dd5b5de44daa514a739e0790f6e58d5e82762dc4784789738b1aef367c5c64a449f576aa7fb5846')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/flip-link

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
