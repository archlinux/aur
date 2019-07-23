# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-audit
pkgver=0.7.0
pkgrel=1
pkgdesc="Audit Cargo.lock for crates with security vulnerabilities"
url="https://github.com/RustSec/cargo-audit"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/RustSec/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('31eb5000a671705e2c7734cc49c2a9274d10c93694ff6d5a1dad1a99d3855e05')

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
