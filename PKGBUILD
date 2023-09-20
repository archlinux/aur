# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=pest-language-server
pkgver=0.3.6
pkgrel=1
pkgdesc='Language Server Protocol implementation for pest grammars'
arch=('x86_64' 'aarch64')
url="https://github.com/pest-parser/pest-ide-tools"
license=(Apache)
makedepends=(cargo)
depends=(glibc gcc-libs openssl)
_basename="pest-ide-tools-${pkgver}"
source=("${_basename}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b6222266e16aced64de83b5b7e54e5c2acea13d684b4f37b17c36c956cd605e')
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
