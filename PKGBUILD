# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: limforge

pkgname=noorfetch
pkgver=3.2.0
pkgrel=1
pkgdesc="Minimal and fast system information fetch tool written in Rust"
arch=('x86_64')
url="https://codeberg.org/limforge/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('glibc' 'libgcc')
source=("https://codeberg.org/limforge/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6df9e36423679423e64ad51f16b7409b2f26a54a4ccbf4624960dc48d0d24e1b')

prepare() {
  cd "${pkgname}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release --frozen
}

package() {
  cd "${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
