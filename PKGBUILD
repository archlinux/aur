# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=snekdown
pkgver=0.33.1
pkgrel=1
pkgdesc='Parser and renderer for Snekdown - a custom markdown syntax'
arch=(x86_64)
url=https://github.com/trivernis/snekdown
license=(GPL3)
depends=(rustup)

makedepends=()

options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/Trivernis/snekdown/archive/v0.33.1.tar.gz)
sha512sums=('237ed2fedb4b88687909897a82488d0f85f35114abd1db0ec1a92cc63ddb33622dc6c7e72b2f20a7a7a9d56251bba1b40d3e1a2926cccbee9c5d58dff2b118e3')

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
