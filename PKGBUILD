# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-compete
pkgver=0.10.7
pkgrel=1
pkgdesc="Cargo subcommand for competitive programming"
url="https://github.com/qryxip/cargo-compete"
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cargo')
arch=('x86_64')
license=('Apache-2.0' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2f0bb7e01c12b3f6d2ef0b69f1cfb52fb90b854876684bfcf69bc307addd3203adfd0cdfc1601b185bdeb10b61886543c4e3384dfdbcd8cb24b0bd14c4bc4332')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

# https://github.com/qryxip/cargo-compete/issues/216
# check() {
#  cd "${pkgname}-${pkgver}"
#  cargo test --frozen
# }

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
