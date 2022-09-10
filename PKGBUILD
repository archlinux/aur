# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=rust-racer
_pkgname=racer
pkgver=2.2.1
pkgrel=1
pkgdesc="Code completion for Rust"
url="https://github.com/racer-rust/racer"
depends=('gcc-libs')
makedepends=('rustup')
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/racer-rust/racer/archive/${pkgver}.tar.gz")
sha256sums=('371661152c2ebabc4257be5fd1862ae53a74a37fa9c38b28c3026f4a1aefcc9d')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

# Currently borked :<
# check() {
#   cd "$_pkgname-$pkgver"
#   rustup set profile minimal
#   rustup default nightly-2020-07-21
#   cargo test --release --locked
# }

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/racer "$pkgdir/usr/bin/racer"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
