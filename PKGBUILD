# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast type checker and IDE for Python"
arch=("x86_64" "aarch64")
url="https://github.com/facebook/pyrefly"
license=("MIT")
makedepends=(
  "cargo-nightly"
  "git"
)
options=(!lto)
source=("${pkgname}::git+https://github.com/facebook/pyrefly#tag=${pkgver}")
b2sums=('8e9c7b87300c5eabc70a855e7d055448271c2ef8a067906d005508b3f58feca9f5e1414d970e8ba6c10c3f5309902a62f2c7ab6f6dc28e3c64a1ecb6459e60d0')

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
