# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname='bmputil'
pkgver=0.1.3
pkgrel=1
pkgdesc='A management utility for debuggers running the Black Magic Debug firmware'
arch=('any')
url='https://github.com/blackmagic-debug/bmputil'
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2f32680f608a3a061c61f4fab5462157c15485fc1f3a89ad8c90e79ecbb13a18a64ab1dd9ab252430487ae953dcc8a4d73eb110c6d7b4ee5804bf5c5f7749298')

prepare() {
  cd "${pkgname}-${pkgver}"
    
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
