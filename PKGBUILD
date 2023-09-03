# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgdesc='A multi-language version and dependency manager'
pkgver=0.16.0
pkgrel=1
license=('MIT')
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
makedepends=('cargo')
options=('!lto')
_sha='dac2d70'
source=("${pkgname}-${pkgver}-${_sha}.tar.gz::https://api.github.com/repos/moonrepo/proto/tarball/${_sha}")
sha512sums=('879b2865bcd50f42f90cafad97f99bf273fc182b81b7967ef3c658b923675dda51f32568d3ac051a5d9b36119d849bcac430270083f04c2b0854817e1bbb6da9')

prepare() {
  cd "moonrepo-proto-${_sha}"
  export RUSTUP_TOOLCHAIN="stable"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "moonrepo-proto-${_sha}"
  export RUSTUP_TOOLCHAIN="stable"
  export CARGO_TARGET_DIR="target"
  cargo build --release --frozen
}

package() {
  cd "moonrepo-proto-${_sha}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
