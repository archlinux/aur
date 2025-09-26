# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-xwin
pkgver=0.19.2
pkgrel=1
pkgdesc="Cross compile Cargo project to Windows MSVC target with ease"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rust-cross/cargo-xwin"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('ca611706f4412dcb9d9452dd43c599c00abb5d34ed022a7e032c90ba632a0dba8576841d32ec8f8f37e4a377a5cfc0ea65760fd205f9a6aa8bdede511028a67c')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/cargo-xwin
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
