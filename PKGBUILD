# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.4.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/cargo-crev-v${pkgver}.tar.gz")
sha512sums=('e9d4844affca24a6b2311fad63567ed1bf17af7d6c2e74d48f1ac4857e41c6dd432a19fbe4e9cfa7bf0205b99ab111a00004a7cfec5dda50c4633f3539964281')

build() {
  cd "crev-${pkgname}-v${pkgver}/cargo-crev"
  cargo build --release --locked
}

check() {
  cd "crev-${pkgname}-v${pkgver}"
  cargo test --release --locked
}

package() {
  cd "crev-${pkgname}-v${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
