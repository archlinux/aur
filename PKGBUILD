# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=pest-language-server
pkgver=0.3.11
pkgrel=1
pkgdesc='Language Server Protocol implementation for pest grammars'
arch=('x86_64' 'aarch64')
url="https://github.com/pest-parser/pest-ide-tools"
license=("Apache-2.0")
makedepends=(cargo)
options=(!lto)
depends=(glibc gcc-libs)
_basename="pest-ide-tools-${pkgver}"
source=("${_basename}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6e3327c78b62aa12e4e2884449021e2915a97ccef36d1d907bbe669dbb1aaf5b')
_src="${_basename}/language-server"

prepare() {
  cd "${_src}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_src}"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_src}"
  cargo test --frozen --all-features
}

package() {
  cd "${_src}"
  install -Dm755 target/release/"${pkgname}" -t "$pkgdir/usr/bin/"
}
