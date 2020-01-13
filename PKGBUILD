# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=0.2.10
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('any')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dtolnay/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ff850b31709ebf9a2d5eeaf19df513f8b4cbbbe675f2dd6d7ca3d9d893588c9297ef21fb37bfaf659f648cce433ec19d45570d02b21f37f3f23400a93b5b9e60')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
