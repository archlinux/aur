# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.29.2
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
b2sums=('c0ed04306a7e52c60c1dd00bf23b16f9867b371e7e81a0cdfd27d9da5ab8cdcd731a59252e9a80eed015a3dd0eda3216c1d889450887007afc6ec9fad3f0a96a')

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
