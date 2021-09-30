# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=cargo-lock
pkgver=7.0.1
pkgrel=1
pkgdesc="Self-contained Cargo.lock parser"
url="https://github.com/rustsec/rustsec/tree/main/cargo-lock"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/rustsec/rustsec/archive/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('895f5ff7507553db147533caecfd4de8e0afb2393aa4621298b358d1af44addd')

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
