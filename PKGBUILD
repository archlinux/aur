# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgdesc='A multi-language version and dependency manager'
pkgver=0.16.1
pkgrel=1
license=('MIT')
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
makedepends=('cargo')
options=('!lto')
_sha='975ef98'
source=("${pkgname}-${pkgver}-${_sha}.tar.gz::https://api.github.com/repos/moonrepo/proto/tarball/${_sha}")
sha512sums=('a2f5c14c873ed96f3769be3fde6c9c5f4a9bab28f3721a3c030eec7c524d5681b48ea555af448b5d9b14f48faf0480a86cb7bd4b9573f249fb4cead6adfdedcf')

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
