# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-audit
pkgver=0.8.1
pkgrel=1
pkgdesc="Audit Cargo.lock for crates with security vulnerabilities"
url="https://github.com/RustSec/cargo-audit"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/RustSec/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2240d4dbfcb2c12a730d5168581cb1bf6f936e92d081509bb51ff25b2de41c19')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
