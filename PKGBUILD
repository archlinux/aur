# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.37.0
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
b2sums=('7fc6dfed027695b95bc413541955e9b562c7f7668698bf0709085d0ef7adc44eafd2faaf615ce754639ebc3bc527964ac5d0896849f2fa1abd7b3bd518b90142')

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
