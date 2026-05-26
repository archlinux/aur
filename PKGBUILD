# Maintainer: hase9awa <hase9awa@users.noreply.github.com>

pkgname=termtypist
pkgver=0.1.2
pkgrel=1
pkgdesc='Keyboard-first terminal typing trainer inspired by Monkeytype'
arch=('x86_64')
url='https://github.com/hase9awa/termtypist'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e36cec988775ae85f6b7e7f18862236cb769434ce423ad0deadecc25c3424d90')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
