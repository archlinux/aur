# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.61.1
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
source=("${pkgname}::git+https://github.com/facebook/pyrefly#tag=${pkgver}")
b2sums=('608a8ac1edbbd202fc47b94b805217043bdfd7e7e45deac6915c88b4124a49214b95832680753ed19ece6cef8c7ada4c42d0ef3192efe9d64d64c79e943068b7')

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
