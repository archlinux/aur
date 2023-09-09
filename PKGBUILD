# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=almanac
pkgver=0.4.2
pkgrel=1
pkgdesc='Simple .ics parser to pretty print the events on the terminal'
arch=('x86_64')
url='https://github.com/freswa/almanac'
license=('GPL3')
makedepends=('rust' 'git')
# source=("https://gitlab.com/meskio/almanac/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/freswa/almanac/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('924270499ce145e510af24a35af26c168e4bf25eca118e0c8f2db4955d37e04082efa2852a08cb509c58a71d08f1ed051b7115cc0b63445294611a2cc0fd5c99')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd ${pkgname}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}"/usr/bin target/release/${pkgname}
}
