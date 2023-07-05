# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=pest-language-server
pkgver=0.3.2
pkgrel=1
pkgdesc='Language Server Protocol implementation for pest grammars'
arch=('x86_64' 'aarch64')
url="https://github.com/pest-parser/pest-ide-tools"
license=(Apache)
makedepends=(cargo openssl)
depends=(glibc gcc-libs openssl)
_basename="pest-ide-tools-${pkgver}"
source=("${_basename}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d8f308c96d0437904ac3b8a20805008ebb053dcfc90108f09fd6ea291aa49c39")
_src="${_basename}/language-server"

prepare() {
  cd "${_src}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_src}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

# check() {
#   cd "${_src}"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${_src}"
  install -Dm755 target/release/"${pkgname}" -t "$pkgdir/usr/bin/"
}
