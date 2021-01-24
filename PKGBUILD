# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=snekdown
pkgver=0.33.3
pkgrel=1
pkgdesc='Parser and renderer for Snekdown - a custom markdown syntax'
arch=(x86_64)
url=https://github.com/trivernis/snekdown
license=(GPL3)
depends=(rustup)

makedepends=()

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/snekdown/archive/v0.33.3.tar.gz)
sha512sums=('d3670c5398c1c74810aa8285aa286b80372e8ff6b286c1a4c55c064ae576783532b1a6457f24d78c77736ade0e475b9990b75dfb988355e5834f52e0281ec3f9')

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
