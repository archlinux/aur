# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.6.8
pkgrel=1
pkgdesc="Cargo plugin for linting your dependencies"
url="https://github.com/EmbarkStudios/cargo-deny"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d6e480af4b9acd6582739000d02cb7651d50be42ed6a1c1fbaada56bd4992c3e2b1de532f312062ea1290ff41c194d5c028af19ed517659f88f30ce91ac403a0')

build() {
  cd "cargo-deny-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "cargo-deny-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "cargo-deny-${pkgver}"
  install -Dm755 \
    "target/release/cargo-deny" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
