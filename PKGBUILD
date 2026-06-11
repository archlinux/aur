# Maintainer: Ecys <rioisthebestiloverio@gmail.com>
pkgname=octorus
pkgver=0.6.6
pkgrel=1
pkgdesc="A TUI tool for GitHub PR review, designed for Helix editor users"
arch=('x86_64' 'aarch64')
url="https://github.com/ushironoko/octorus"
license=('MIT')
depends=('gcc-libs' 'openssl' 'git')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ee28e35f67cf2681ea472c2e080df77e3d472c14f48093f172da0d84de251a7a')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/or" "${pkgdir}/usr/bin/or"
  install -Dm644 "crates/tree-sitter-vue3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
