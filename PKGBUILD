# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='bmputil'
pkgver=0.1.0
pkgrel=1
pkgdesc='A management utility for debuggers running the Black Magic Debug firmware'
arch=('any')
url='https://github.com/blackmagic-debug/bmputil'
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
source=("https://github.com/blackmagic-debug/bmputil/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ab7d61bcab90b04fa4126dcd55ddbb905902c98f9a11dff174203f8230523c6e8a5f1c9cb86b7686388694089fcf0f1004cb0bd3c0ed3aa877e763d18e978086')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

# No tests implemented
# check() {
#   cd "${pkgname}-${pkgver}"

#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --no-default-features
# }

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
