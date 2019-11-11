# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.11.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl' 'curl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/v${pkgver}.tar.gz")
sha512sums=('6987c92d538b05f347026ef356ce7b84d0999796ea57402c55403cc730d09c77eb05a7b416a290b8f8ee24c514b32c50bc73009caadf24f687b43f7ebbf5e7f1')

build() {
  cd "${pkgname}-${pkgver}/cargo-crev"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
