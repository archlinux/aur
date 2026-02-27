# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ccase
pkgver=0.5.0
pkgrel=1
pkgdesc="A command line utility for converting between string cases"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rutrum/ccase"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('799507a01518dcf110e07533a9a9bd72945292abcfa82ea20059c13ab91db8803fc4986b8d4375af3c02e25e8499e05d91b3a44aee1793a3bbdcdb032038f66c')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/ccase "${pkgdir}/usr/bin/ccase"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
