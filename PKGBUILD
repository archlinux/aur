# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=cargo-shuttle
pkgver=0.7.2
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
sha512sums=('38e9d00430e2f5089ee1d1a23632371d939ec5179810c4390ad474c22fc21731333c93d2000a1721d5b41c01aac7e4ad76fd50733c93caadc72c2834085f1348'
            '1eec1f13b3e0da9785682f4513321987163203e64e4bd934d12eb633ce52c0dfe9515c5f7b92af16b62a942bd4dcf3712edfba966c5b741496a027cbcbd57066')
b2sums=('f71e15f2268b901a283f1adcc8de5fb59df9d2b31f937cd2d4bf6b88d014fb6a1a63ecba38ebc0ee81bb6669ba3f9c6836f0d74ad0257ddc7a0bcbe4935e98c6'
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
