# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=wasm-server-runner
pkgver=1.0.0
pkgrel=1
pkgdesc="cargo run for the browser."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/jakobhellermann/wasm-server-runner"
license=("MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
b2sums=('ba4b2b9144d714ce1859e944f13ea688c9f32be7b3c2d900985b1b679805a4f1a64695ab11172af10a52ae6534557f3727f9e40e36c7b51b667f524e68c87f0e')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 -t "${pkgdir}/usr/bin" target/release/${pkgname}
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
}
