# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-xwin
pkgver=0.20.0
pkgrel=1
pkgdesc="Cross compile Cargo project to Windows MSVC target with ease"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rust-cross/cargo-xwin"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('5cf5ed1f3f4cf6b38b3542a5632e832c993944534ccb66d3af3c1dfce9ffe88fbb8096b6ced66b2c813d42a5d418d7e8835bea1845dcc1d1762ee5c2346c9b70')

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
