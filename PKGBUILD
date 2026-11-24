# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=datafusion-dft
pkgver=0.2.3
pkgrel=1
pkgdesc="CLI and TUI for querying data with Apache DataFusion"
arch=('x86_64' 'aarch64')
url="https://github.com/datafusion-contrib/datafusion-dft"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('806e4989f7e951aa04b00594f7c7f34ce2cb1877eccf6db1b782042413533a3d')

prepare() {
  cd "datafusion-dft-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "datafusion-dft-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "datafusion-dft-${pkgver}"
  install -Dm755 "target/release/dft" "${pkgdir}/usr/bin/dft"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
