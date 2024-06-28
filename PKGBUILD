# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tage
pkgver=0.1
pkgrel=1
pkgdesc="Turn based empire warfare in the terminal"
url="https://github.com/jacopograndi/tage"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5dedaf52240b9ac478c9af8a8ab5751d830062ae45365af199d9c28ddd9685e5ba5f32b9ed2141f93d607db17f8aa3e12bcab4f4d7f737b4eb2c3be16482e067')

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

# https://github.com/jacopograndi/tage/issues/1
package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 license.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
