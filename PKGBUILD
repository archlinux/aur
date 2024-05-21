# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rebels-in-the-sky
pkgver=1.0.9
pkgrel=1
pkgdesc="P2P terminal game about spacepirates playing basketball across the galaxy"
url="https://github.com/ricott1/rebels-in-the-sky"
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('105b4100d8e52fba68a2e4ec5459ef33c67d09e8599d6877767ce3330814efda8fde9ea165fd20e02379970a8cc597e76b72c1291575d7e31a3c45eda7fc97a2')
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
