# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-audit
pkgver=0.6.1
pkgrel=1
pkgdesc="Audit Cargo.lock for crates with security vulnerabilities"
url="https://github.com/RustSec/cargo-audit"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/RustSec/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('29be878cccb9066a7567d23c1579544d309ebc30070c543b98be5dc191ff08d3')

build() {
  cd "${pkgname}-${pkgver}"
  # missing Cargo.lock: https://github.com/RustSec/cargo-audit/issues/69
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
