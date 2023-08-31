# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgdesc='A multi-language version and dependency manager'
pkgver=0.15.1
pkgrel=1
license=('MIT')
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
makedepends=('cargo')
options=('!lto')
_sha='d98deb6'
source=("${pkgname}-${pkgver}-${_sha}.tar.gz::https://api.github.com/repos/moonrepo/proto/tarball/${_sha}")
sha512sums=('5881c57c0d6cfa3d9b4fb8cbe22325c5c3eaeec4cdc3662783c80139db59c187edfcb5969a2a18839f8e59174d27c4745e7cb7970b9ef08845456b1fa82222f0')

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
