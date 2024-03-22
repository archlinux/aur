# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rebels-in-the-sky
pkgver=1.0.7
pkgrel=1
pkgdesc="P2P terminal game about spacepirates playing basketball across the galaxy"
url="https://github.com/ricott1/rebels-in-the-sky"
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a89cd4d6c5bf59cba3c49f052d29a43788bec939c99a65ade48f366327d4521bff423f70293ff7ec40de815c7d5e0b7f90a5918c4a5ccb465496815ed06f8138')
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
