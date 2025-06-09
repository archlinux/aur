# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.18.1
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
source=("git::git+https://github.com/facebook/pyrefly#tag=${pkgver}")
b2sums=('e83d6150bef860b9e6ff7c1f1bec65b1056f41dcbd90e6dc9aebb59d6cc68a44c2f00af04647051091bdfe2c3345ba5fcf1694991422f09cd0b47e619a43c7d3')

prepare() {
  cd "${srcdir}/git/pyrefly"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/git/pyrefly"
  cargo build --release --frozen
}

check() {
  cd "${srcdir}/git/pyrefly"
  cargo check
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "${srcdir}/git/target/release/pyrefly"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/git/LICENSE"
}
