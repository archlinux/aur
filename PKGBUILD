# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.3.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/cargo-crev-v${pkgver}.tar.gz")
sha512sums=('9940049f4b8ecf5e0646bd086529c9a77a0accd75ed8596deaf43155fa021c69b7a04cdb4d4b99dd87f02dcdf02afd581226ee34b1e1b342a49847b343d1ce8d')

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
  # part of the next release
  #install -Dm644 \
  #  LICENSE-APACHE \
  #  LICENSE-MIT \
  #  LICENSE-MPL2 \
  #  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
