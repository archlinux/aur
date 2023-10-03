# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='bmputil'
pkgver=0.1.1
pkgrel=1
pkgdesc='A management utility for debuggers running the Black Magic Debug firmware'
arch=('any')
url='https://github.com/blackmagic-debug/bmputil'
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
source=("https://github.com/blackmagic-debug/bmputil/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d9f1039db3bc2fa49e1787748a5cc634c5bb81eda9b42fc0043c15dfe34ab59351e9225340e97eef386502f08d2490034f8c9df3ec6f152639694b265c1d77a2')

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
