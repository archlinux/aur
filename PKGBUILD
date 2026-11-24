# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wifui
pkgver=0.6.0
pkgrel=1
pkgdesc="Keyboard-driven TUI for managing Wi-Fi connections"
arch=('x86_64' 'aarch64')
url="https://github.com/sohamw03/wifui"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('501612489c7b0604f390f3035e41cb0350744420d16b2b2435820038ff9e44a6')

prepare() {
  cd "wifui-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "wifui-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "wifui-${pkgver}"
  install -Dm755 "target/release/wifui" "${pkgdir}/usr/bin/wifui"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
