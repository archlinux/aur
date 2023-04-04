# Maintainer: qubidt <qubidt at gmail dot com>

pkgname=highlight-stderr
pkgver=0.2.1
pkgrel=1
pkgdesc="Run a command and highlight its stderr, preserving the order of stdout and stderr "
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/joshtriplett/highlight-stderr"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
