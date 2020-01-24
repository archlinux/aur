# Maintainer: Ilaï Deutel

pkgname=cargo-lock
pkgver=4.0.1
pkgrel=1
pkgdesc="Cargo subcommand to analyze Cargo.toml packages and translate Cargo.lock files"
url="https://github.com/RustSec/cargo-lock"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/RustSec/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7fd41181d03027207581ccd3496ae99241b44e284b9e1aec6a32cd10b2fd0762')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
