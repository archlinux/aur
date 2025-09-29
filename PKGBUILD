# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.35.0
pkgrel=1
pkgdesc="A fast type checker and IDE for Python"
arch=("x86_64")
url="https://github.com/facebook/pyrefly"
license=("MIT")
makedepends=(
  "cargo-nightly"
  "git"
)
options=(!lto)
source=("${pkgname}-${pkgver}::git+https://github.com/facebook/pyrefly#tag=${pkgver}")
b2sums=('178ea83149fc3350d792adc039485f41e24549f2d208adc04b651edb0aaf6f222d1ab78d1757834b0c7c5a5baee4d7b05ea418abb8cb9c29c47438d2c3bf0196')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/pyrefly"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/pyrefly"
  cargo build --release --frozen
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/pyrefly"
  cargo check
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}-${pkgver}/target/release/pyrefly"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/${pkgname}-${pkgver}/LICENSE"
}
