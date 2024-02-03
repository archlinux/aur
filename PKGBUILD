# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=linkal
pkgver=0.1.0
pkgrel=1
pkgdesc="A public-calendar aggregator server"
arch=('x86_64')
url="https://github.com/JulienMalka/Linkal"
license=(GPL3)
makedepends=('cargo')
provides=(${pkgname})
conflicts=(${pkgname})
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/JulienMalka/Linkal/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('eb30c1189e97706b3b2b7b2542c028eb89e2a336b2f243e992d4f5bd08f30bcf')


build() {
  cd ${pkgname^}-${pkgver}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd ${pkgname^}-${pkgver}
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

