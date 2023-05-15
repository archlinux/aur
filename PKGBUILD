# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=cargo-lock
pkgver=9.0.0
pkgrel=1
pkgdesc="Self-contained Cargo.lock parser"
url="https://github.com/rustsec/rustsec/tree/main/cargo-lock"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/rustsec/rustsec/archive/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c34f89734a91d46f5e48234a35022399d4d7cf5ec9323ad5857ae8a4f009face')

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
