# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.10.1
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl' 'curl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/v${pkgver}.tar.gz")
sha512sums=('b497e419ffbfc09ff9beae6d003311690dad91d286d046f93a744e7a2444095d2caeac580e8450a871fb8d31a68f1a615eac191824a206ca2316e9f2dbb8fd55')

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
