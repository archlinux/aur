# Owner: BrokenCloud <jgbsxx20130315@gmail.com>
# Maintainer: HyacinthHaru <hyacinth@haru.ac>
pkgname=haru
_crate=haru-cat
pkgver=1.0.3
pkgrel=1
pkgdesc='A tiny cat living in your terminal'
arch=('x86_64' 'aarch64')
url='https://haru.cat'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$_crate-$pkgver.crate::https://static.crates.io/crates/$_crate/$_crate-$pkgver.crate")
sha256sums=('d9b1c21d45280976280506eeb1ee8d096a3207b6fec61e3991055d7974d03bc2')

prepare() {
      cd "$_crate-$pkgver"
      export RUSTUP_TOOLCHAIN=stable
      cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
      cd "$_crate-$pkgver"
      export RUSTUP_TOOLCHAIN=stable
      export CARGO_TARGET_DIR=target
      cargo build --frozen --release
}

check() {
      cd "$_crate-$pkgver"
      export RUSTUP_TOOLCHAIN=stable
      cargo test --frozen --release
}

package() {
      cd "$_crate-$pkgver"
      install -Dm0755 target/release/haru "$pkgdir/usr/bin/haru"
      install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
