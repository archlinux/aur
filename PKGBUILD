# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.18.0
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
b2sums=('4f56e2444925e9382e532497c700fbb763bb3770d58c0b990b40a6cb0bc4d179accdf42382fa33d4cd25911625db193aa134e568057b42ba262e03e84d7e30dc')

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
