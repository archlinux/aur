# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=rust-racer
_pkgname=racer
pkgver=2.1.41
pkgrel=2
pkgdesc="Code completion for Rust"
url="https://github.com/racer-rust/racer"
depends=('gcc-libs')
makedepends=('rustup' 'cmake')
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/racer-rust/racer/archive/v${pkgver}.tar.gz")
sha256sums=('97f77f71648cb7f2e519c7ca71dd90dac435dde662e38f9a328abfbccc275c34')

build() {
  cd "$_pkgname-$pkgver"
  rustup set profile minimal
  rustup default nightly-2020-07-21
  cargo build --release --locked
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
