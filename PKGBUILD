# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rebels-in-the-sky
pkgver=1.0.8
pkgrel=1
pkgdesc="P2P terminal game about spacepirates playing basketball across the galaxy"
url="https://github.com/ricott1/rebels-in-the-sky"
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b7e27305e82d996b926422996555d3f73a6a0adc3c717fb3127e71a44b57f8171ab35860ab9892b5a3ffecc1d71e45ad208e6da3175dae04804e9342138939b7')
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
