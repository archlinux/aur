# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: limforge

pkgname=noorfetch
pkgver=3.0.0
pkgrel=1
pkgdesc="Minimal and fast system information fetch tool written in Rust"
arch=('x86_64')
url="https://codeberg.org/limforge/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('glibc' 'libgcc')
source=("https://codeberg.org/limforge/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b2ade672f29545880815377478e83dc0651333089f8dd00d8cc17a066e5bed34')

prepare() {
  cd "${pkgname}"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}"

  cargo install --frozen --root "${pkgdir}/usr" --path . --no-track

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
