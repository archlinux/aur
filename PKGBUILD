# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ccase
pkgver=0.5.1
pkgrel=1
pkgdesc="A command line utility for converting between string cases"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rutrum/ccase"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('09389938625708dc6e34ad1fcd2f95df502febb37c0553c8a6816a56eafdfe8c76ae72704c5b02bd1bcceab5ee0c8f45c55bf563a13987a5698f684ab5d5f8cd')

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
