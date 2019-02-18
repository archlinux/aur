# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.6.2
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/broot-v$pkgver.tar.gz")
sha512sums=('d3b6560857cb9802d05da9d94648ea7007246972f9913aa23729eeaf70f31243df844940da0d918b2cf58bdd378b859c62e78aa6542a666c243b4a243e28541f')

prepare() {
  cd broot-$pkgver
  sed -i '34s/0.6.1/0.6.2/' Cargo.lock
}

build() {
  cd broot-$pkgver
  cargo build --release --locked
}

check() {
  cd broot-$pkgver
  cargo test --release --locked
}

package() {
  cd broot-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/broot
  install -Dm644 -t "$pkgdir"/usr/share/licenses/broot LICENSE
}

# vim:set ts=2 sw=2 et:
