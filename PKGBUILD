# Maintainer: George Rawlinson <grawlinson@archlinux.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=pulldown-cmark
pkgver=0.9.3
pkgrel=3
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=(x86_64)
url="https://github.com/raphlinus/$pkgname"
license=(MIT)
depends=(gcc-libs)
makedepends=(rust)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('2f5acf1b6f345ea2f82c6daeb4b73c93c2772dcfb7ccff6fba9e51b8840b0662202eb3bd1c917f8f81be1ba86b58fb3d5f87616dbdca991e0ef6fc249dc888fe')
b2sums=('0b4105a9452139865723a66e434804da7fec35771a90335debe579164ce7ddd78192949db77ad5427ff80b44805a8fa5ca497e6b4111344aaa014faaa508904f')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
  cd "$_archive"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
}

build() {
  _srcenv
  cargo build --frozen --release
}

check() {
  _srcenv
  cargo test --frozen
}

package() {
  cd "$_archive"
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
