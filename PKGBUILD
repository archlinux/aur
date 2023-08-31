# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=wasm-server-runner
pkgver=0.4.0
pkgrel=1
pkgdesc="cargo run for the browser."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/jakobhellermann/wasm-server-runner"
license=("MIT")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
b2sums=('39d7fa608d9fff9502c6a4b38f7897b60fdfb577a20a58c208ef9bed08ebdf99adfdedf009cb075a280b4621716f3cf10bd208dd758ae9322f67b0c9d75f6d96')

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
