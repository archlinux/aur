# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.60.0
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
b2sums=('6d210712cda6bd843e176c267c566c5b6169c168a512151aff144bc0c34a1902b03a572a2865d03d743749cf8e594cf88e737fe6753b8a87551d3a8a61dc9b46')

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
