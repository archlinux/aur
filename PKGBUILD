# Maintainer: Jonas Riedel <jonasriedel@pm.me>

pkgname=rusty-ls
pkgver=0.1.2
pkgrel=1
pkgdesc="A replacement of the ls command"
arch=('x86_64')
url="https://github.com/jonasrdl/rusty-ls"
license=("MIT")
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=("SKIP")

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # use cargo to build from a tagged release
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --all-features
  cd -
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}