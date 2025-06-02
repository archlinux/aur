# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.17.1
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
b2sums=('44ef00d0962a99549ba9b93b0cfc169438fb60868094e9c6787533cc6db31c543a12dbd9db0c06723d8c06c31beef01753c6396997bb8f14ae30da7a075517ab')

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
