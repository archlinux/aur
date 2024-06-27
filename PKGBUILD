# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sxtetris
pkgver=1.1.0
pkgrel=1
pkgdesc="A terminal Tetris game"
url="https://github.com/shixinhuang99/sxtetris"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('196a075f8b5981f06c7b750039840b1d9602c08ac9896779cff20b11984d778bd71ddb57729462f2cc2745d1f1ea24322c9b7d7ff648bce57d389a7c50d3b4c2')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
