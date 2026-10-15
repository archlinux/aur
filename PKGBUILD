# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=1.4.0
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
b2sums=('e6f07af9500c04d6b5cee911d9b52194b53c54213b13b4485fad73fcf1d0656981adc6f5249daf982a2ce16a360e02b9b8d8e283d511a27cf354f3e44db224a4')

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
