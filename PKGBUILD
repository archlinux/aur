# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=1.5.0
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
b2sums=('71d6cc8d929a20448c72b61f8563aa888e149aee06299e79e130f53c337d4ff1b301a8c55f516b6b55bca4e68d276f0dc61e30fbf61ac6739e6d6b96bbb358b0')

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
