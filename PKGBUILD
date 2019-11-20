# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.12.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl' 'curl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/v${pkgver}.tar.gz")
sha512sums=('e96ef57592cd7f9d6d784aec292152fc86bcccea914fc4adab190a61ce76e57319274c66bc61c2e7740c6d6793d7a34caf61d1979b5a3c825564709f6bdd99fa')

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
