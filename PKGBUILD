# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.6.7
pkgrel=1
pkgdesc="Cargo plugin for linting your dependencies"
url="https://github.com/EmbarkStudios/cargo-deny"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b7144f9355b95859980f14a26f550c9124e8734090fe5e5597f2d6c92dc55035313e622ae1cd642a26916ee9bab42831a91f7f9b9fd6e28c631b8e2fda493d3b')

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
