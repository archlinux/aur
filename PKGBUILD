# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=peep
pkgver=0.1.6
pkgrel=1
pkgdesc="A CLI text viewer tool that works interactively like less command on small pane within the terminal window."
url="https://github.com/ryochack/peep"
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ryochack/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('780b2d99d8a0920a0669e0aaca98ef8111e13b54ec99f38b683ba6fc82e9bc58')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
