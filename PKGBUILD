# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=1.3.0
pkgrel=1
pkgdesc="A fast type checker and IDE for Python"
arch=("x86_64" "aarch64")
url="https://github.com/facebook/pyrefly"
license=("MIT")
makedepends=(
  "cargo"
  "git"
)
options=(!lto)
source=("${pkgname}::git+https://github.com/facebook/pyrefly#tag=${pkgver}")
b2sums=('5ace41105187eb19b377228c8e0df864942f5c87e513fff0a67eb213b07e5d7ddb59f550ad08da1bd4f7f5cdc3765cffc7384f571d3d97355caf1c6d7b3f78c4')

prepare() {
  cd "${srcdir}/${pkgname}/pyrefly"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}/pyrefly"
  cargo build --release --frozen
}

check() {
  cd "${srcdir}/${pkgname}/pyrefly"
  cargo check
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}/target/release/pyrefly"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/${pkgname}/LICENSE"
}
