# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-deny
pkgver=0.11.1
pkgrel=1
pkgdesc="Cargo plugin for linting your dependencies"
url="https://github.com/EmbarkStudios/cargo-deny"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/EmbarkStudios/cargo-deny/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0d641b03020669e456771645e701529cb8b3e694d52e54fd3ed16c22ce3f5ca409d6462f42a96723680a093fc065f169c997ed1fe43902221407f92887b52f80')

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
