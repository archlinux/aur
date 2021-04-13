# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=snekdown
pkgver=0.33.4
pkgrel=1
pkgdesc='Parser and renderer for Snekdown - a custom markdown syntax'
arch=(x86_64)
url=https://github.com/trivernis/snekdown
license=(GPL3)
depends=(rustup)

makedepends=()

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/snekdown/archive/v0.33.4.tar.gz)
sha512sums=('98dc4d4b2b39ce947d9b72e19a49c8a4a3585f7cbf779b682494f2cdb278a987ab4714ad76b8393d05c6f71ae8fba48ed8c0d9abd84f814028e8073c5712fc31')

prepare() {
  cd $pkgname-$pkgver
  rm rust-toolchain
  rustup default nightly
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --all-features
}

package() {
  cd $pkgname-$pkgver/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a snekdown "$pkgdir"/usr/lib/snekdown
  ln -s /usr/lib/snekdown "$pkgdir"/usr/bin
}
