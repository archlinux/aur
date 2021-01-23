# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=snekdown
pkgver=0.33.2
pkgrel=1
pkgdesc='Parser and renderer for Snekdown - a custom markdown syntax'
arch=(x86_64)
url=https://github.com/trivernis/snekdown
license=(GPL3)
depends=(rustup)

makedepends=()

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/snekdown/archive/v0.33.2.tar.gz)
sha512sums=('d84e685af95e8c3a7ad602ff7b8a04698a2eb8c17c8ee94fc68ef04a7d5dad6986996560528cc5c71ff0b69cfbfef7931d8e0f8fa196f693e0b08b5520fe45bb')

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
