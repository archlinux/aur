# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=wasm-server-runner
pkgver=1.0.1
pkgrel=1
pkgdesc="cargo run for the browser."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/jakobhellermann/wasm-server-runner"
license=("MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
b2sums=('d6c26c70f6f0f3123f089fd0b0f4c0fd9d22263fd57ba83d1e1aafe3b8c93a912a0b60c3ca5769d4ea373f87d997dc7afd009d01c2e15e081750f828c57c80ef')

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
