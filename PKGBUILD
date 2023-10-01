# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-i18n
pkgver=0.2.12
pkgrel=1
pkgdesc="Cargo sub-command to extract and build localization resources to embed in your application/library"
url="https://github.com/kellpossible/cargo-i18n"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kellpossible/cargo-i18n/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4d3873213cdb8ea4758d752cfe18ea66b21f4816476aeeeb3fe0be6983f2989')
b2sums=('5cbb4b8d50fa54baadac772b660a0f4bc50b94e9c4c1623a04674c8cdc0058937cf3a12ba0e799191a061897e9b62c0e83022be83668832fcfbaeda21c68890b')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --bin cargo-i18n --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/cargo-i18n

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
