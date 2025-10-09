# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.36.2
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
b2sums=('ab9e75dd183ae33cf221181c6a42d0be28c31aa839e6f8a0f765d42281709f1c54189af7eac67622373388728546877727b8ec0ee89a59e6c6d14c2608400a5f')

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
