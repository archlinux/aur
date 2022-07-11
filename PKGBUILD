# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-i18n
pkgver=0.2.10
pkgrel=1
pkgdesc="Cargo sub-command to extract and build localization resources to embed in your application/library"
url="https://github.com/kellpossible/cargo-i18n"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kellpossible/cargo-i18n/archive/refs/tags/v$pkgver.tar.gz")
cksums=('4016571452')
sha256sums=('80482a9107ae20014c657b385b19414200acea74f67494f08c9386781cd3ec36')
b2sums=('713bc2073e3ef5c71ffe3483ac1dcdfbc2e7c7a8be5fbb7cd67dc0b16ecb4b3e82d6a5b042c6408416e78b789e5985086f11aaaa9eabcc687800372fa0298493')

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

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
