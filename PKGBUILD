# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.8.2
pkgrel=1
pkgdesc="Cargo plugin for linting your dependencies"
url="https://github.com/EmbarkStudios/cargo-deny"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c9af1aa30f36dac90c3401d1bf734b4425d485bf7f74c9e86fc6b900a7a9652c97f50623e61322cfad4d5cb33155e67b3c1b563e136abdc0862ee6c58bef8751')

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
