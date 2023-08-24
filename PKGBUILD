# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgdesc='A multi-language version and dependency manager'
pkgver=0.15.0
pkgrel=2
license=('MIT')
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
makedepends=('cargo')
options=('!lto')
_sha='d954b60'
source=("${pkgname}-${pkgver}-${_sha}.tar.gz::https://api.github.com/repos/moonrepo/proto/tarball/${_sha}")
sha512sums=('afb267c9352c09acd6460c0d36bd945e86fdf9f4ad17511124855845cd9c3979ae26beaa59bc1be3053d614a5cc8ccb7772f3fe8b31d88cf9e63bef8f6c8df35')

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
