# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=cargo-lock
pkgver=8.0.3
pkgrel=1
pkgdesc="Self-contained Cargo.lock parser"
url="https://github.com/rustsec/rustsec/tree/main/cargo-lock"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/rustsec/rustsec/archive/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4612708a00b85d7790f2a74fc29c1308f5f1f263d85113e251899f8de6f6e850')

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
