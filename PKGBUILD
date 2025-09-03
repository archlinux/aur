# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.31.0
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
b2sums=('1865b3e8332b8ae3fdc680a6d290ac4b83b2096721c9932b2d4b28d0086a8936834c22f06fa73737ed4ba50c1db346f06106a8c7863af2aa9cc1206ecdffa39b')

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
