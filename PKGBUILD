# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=wasm-server-runner
pkgver=0.6.1
pkgrel=1
pkgdesc="cargo run for the browser."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/jakobhellermann/wasm-server-runner"
license=("MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
b2sums=('378583c91663d479459200723641cb5f5d0059b382240fb36cb2ee3424e1768deb9766a058cebc173338104eca69462ad915f6efd7d90a4b7aa7373c70713ee8')

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
