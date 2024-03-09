# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rebels-in-the-sky
pkgver=1.0.6
pkgrel=1
pkgdesc="P2P terminal game about spacepirates playing basketball across the galaxy"
url="https://github.com/ricott1/rebels-in-the-sky"
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6c75d48c7cd4345fab607b77f3f38a6417d897c2d36d82996a39bcfdc8dfd04b098e81bbc18dc452728fde910b72e9017116f08b39f22f597da2b36651a8a192')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

# check() {
#   cd "${pkgname}-${pkgver}"
#   cargo test --frozen -- --skip "test_game"
# }

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/rebels" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
