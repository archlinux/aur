# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=almanac
pkgver=0.4.3
pkgrel=1
pkgdesc='Simple .ics parser to pretty print the events on the terminal'
arch=('x86_64')
url='https://github.com/freswa/almanac'
license=('GPL3')
makedepends=('rust' 'git')
# source=("https://gitlab.com/meskio/almanac/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/freswa/almanac/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('403838cf46a2068a05bb13a5411d8be638d63dbef360ac94124599bfbc3e425b222835528612653bd7037ee02540fb350dac0161f3d24ec213980c1c1fb8de99')

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
