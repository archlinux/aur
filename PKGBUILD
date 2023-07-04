# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=almanac
pkgver=0.4.1
pkgrel=1
pkgdesc='Simple .ics parser to pretty print the events on the terminal'
arch=('x86_64')
url='https://github.com/freswa/almanac'
license=('GPL3')
makedepends=('rust' 'git')
# source=("https://gitlab.com/meskio/almanac/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/freswa/almanac/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('5fa5ff267680f8dceb82f4f3481b1b3a5e0ed5a1babfed4eb778c6aafa06f7e68a616200f4238a6ce6b2c4622e368b25ad94e4702d720929eb4d50175cf71ee0')

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
