# Maintainer: Daan Hessen <daanh2002@gmail.com>
pkgname=earctl
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust API/CLI that allows every device on your network to control your Nothing earbuds"
arch=('x86_64')
url="https://github.com/DaanHessen/earctl"
license=('AGPL-3.0-or-later')
depends=('dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('386997aeca25911cd1252472bdf5898ec4a2c05977495665ed7fd92bf0050416')

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
