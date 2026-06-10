# Maintainer: Ecys <rioisthebestiloverio@gmail.com>
pkgname=rustlens
pkgver=0.2.1
pkgrel=1
pkgdesc="Blazing-fast Rust Code Inspector for the Terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/yashksaini-coder/Rustlens"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3c5729600ad797b1e9e69cae57ba3b60a617bec3f30c27c975ef9d32b70052e1')

prepare() {
  cd "Rustlens-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Rustlens-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "Rustlens-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
