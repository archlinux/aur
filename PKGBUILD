# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tttui
pkgver=2.0.2
pkgrel=1
pkgdesc="Typing test for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/reidoboss/tttui"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92223b631bc3b3fb3df98c1ba42fe485938656afe27fccddb89dc4974290c325')

prepare() {
  cd "tttui-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "tttui-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p tttui
}

package() {
  cd "tttui-${pkgver}"
  install -Dm755 "target/release/tttui" "${pkgdir}/usr/bin/tttui"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
