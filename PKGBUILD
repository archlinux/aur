# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lpl
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line plotting from streaming input sources"
url="https://github.com/SOF3/lpl"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('06c27eca54d5fa4ccbf7b9a0f17c1f6e4f0cdfd983c93ff8c4a9576669e9edf01dac1d7cbb9d1acf9e923d14e22de15faa65bd798acc660cb56eae1431f7d591')

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
}
