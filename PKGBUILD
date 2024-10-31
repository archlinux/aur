# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=cargo-lock
pkgver=10.0.1
pkgrel=1
pkgdesc="Self-contained Cargo.lock parser"
url="https://github.com/rustsec/rustsec/tree/main/cargo-lock"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/rustsec/rustsec/archive/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('82ab6ed92af17394602f567c8e3d0a9d18fb9645229289989a8a00653a04fd6e')

build() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  cargo build --release --locked --all-features
}

check() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  cargo test --release --locked
}

package() {
  cd "rustsec-${pkgname}-v${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${pkgname}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
