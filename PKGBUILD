# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ccase
pkgver=0.4.1
pkgrel=1
pkgdesc="A command line utility for converting between string cases"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rutrum/ccase"
license=("MIT")
conflicts=("ccase-git" "ccase-bin")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('7c739949caddeb836194b62a3a0c67470ef087b7b7670466261500ff57a01e5e53ed2a347dbd75fae4e1813f3ea1755a59e46c4038055ca691fec7b4356b31f6')

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
