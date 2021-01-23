# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=snekdown
pkgver=0.33.0
pkgrel=1
pkgdesc='Parser and renderer for Snekdown - a custom markdown syntax'
arch=(x86_64)
url=https://github.com/trivernis/snekdown
license=(GPL3)
depends=(rustup)

makedepends=()

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/snekdown/archive/v0.33.0.tar.gz)
sha512sums=('535000a22eecd4c947b80c4e1aa3037ce1b468ead3e3f8a0aa1d264153da6d607a27d83af0bf56b3dde24a6d7a833651c0e3f6f1422760ac55e2c0763f5096b4')

prepare() {
  cd $pkgname-$pkgver
  rm rust-toolchain
  rustup default nightly
}

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a snekdown "$pkgdir"/usr/lib/snekdown
  ln -s /usr/lib/snekdown "$pkgdir"/usr/bin
}
