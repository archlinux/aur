# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.8.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl' 'curl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/cargo-crev-v${pkgver}.tar.gz")
sha512sums=('67a5416815cf88e80749be019e1b2e5397a88dceaae28f3581297884fb000f71bf82af189453ccfee24fb519f01d776e61262b2b6903d33d40bd00cf6934f351')

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
