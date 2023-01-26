# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=cargo-shuttle
pkgver=0.8.1
pkgrel=1
pkgdesc='Cargo command for the shuttle platform (https://www.shuttle.rs/)'
url='https://www.shuttle.rs/'
arch=('any')
license=('Apache')
depends=('cargo')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate"
  'https://raw.githubusercontent.com/shuttle-hq/shuttle/main/LICENSE'
)
sha512sums=('8a9dce4c59f159d19278e0bcb2b6312b08112c2f0a89da1dc271d1f840575bd128e6cf0cba42757eb410ee9400e3049a0e80f17eea00f2d4e76a403edb724383'
            '1eec1f13b3e0da9785682f4513321987163203e64e4bd934d12eb633ce52c0dfe9515c5f7b92af16b62a942bd4dcf3712edfba966c5b741496a027cbcbd57066')
b2sums=('0d2ad024d0a907f6ab4599cad8e71318d3b09cde677e4bda7511a4e5094b8c74265a3e9cdb7a941058c1dedb1e2992479844697e4fe95dba9934c99bd917db64'
        '165aa24273d58a1555142e8aa84076a8df9662b8fe0637a2c9b0c096b650d5ee9254075376a19cbf35fce3f21524b7d636f6b50b56c2b360a42a65854996df93')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release
}

package() {
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
