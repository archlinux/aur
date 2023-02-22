# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=almanac
pkgver=0.4.0
_commit=be71912380176043a49a90487e9ce8e5a2d61d45
pkgrel=1
pkgdesc='Simple .ics parser to pretty print the events on the terminal'
arch=('x86_64')
url='https://gitlab.com/meskio/almanac'
license=('GPL3')
makedepends=('rust' 'git')
# source=("https://gitlab.com/meskio/almanac/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("git+https://gitlab.com/meskio/almanac.git#commit=${_commit}")
b2sums=('SKIP')

prepare() {
  cd ${pkgname}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd ${pkgname}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd ${pkgname}
  install -Dm755 -t "${pkgdir}"/usr/bin target/release/${pkgname}
}
