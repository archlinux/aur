# Maintainer: Amolith <amolith@secluded.site>
# Maintainer: Viktoras Agejevas <v.agejevas@gmail.com>
pkgname=goradion
pkgver=0.13.0
pkgrel=1
pkgdesc='Terminal based online radio player'
arch=('x86_64' 'aarch64')
url='https://github.com/agejevasv/goradion'
license=('Unlicense')
depends=('glibc' 'libgcc' 'alsa-lib')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('47bf820e9b4a343ea13cbbb833ab8ba5f65f13d33c345674690c4930b42d384328de29895c013bfc7886409403a5e2b769057a804f7039a1eddd65d4bacc5af0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
