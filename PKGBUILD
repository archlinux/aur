# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylua
pkgver=0.10.0
pkgrel=1
pkgdesc='Code formatter for Lua'
arch=('any')
url=https://github.com/JohnnyMorganz/StyLua
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
b2sums=('730b43993171755b003b0c6b5f85aeebfc36b474d638d37f46db7e08cdcc0ba0ffeccd0c4089bbce227dc21bb4864baacd3a1cda0a47659a645a8855c9a1ea9f')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline --all-features
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked --offline --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}

# vim:set ts=2 sw=2 et:
