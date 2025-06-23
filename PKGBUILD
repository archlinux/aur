# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.21.0
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
b2sums=('4158deeb553616faf5f0229b89860a2ede8377fe12506dc4fceb50555c64e3814d87ca2501b8edd5860de40ae3e24fea955b482caeee32f39ccd7a8ea6e64ef3')

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
