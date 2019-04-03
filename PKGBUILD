# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.5.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl' 'curl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/cargo-crev-v${pkgver}.tar.gz")
sha512sums=('25c4702c480d85cf19ac6ce30402c31dfb12430f9225c78ee7088bc049f0024a9c06e5b4244e55efc9b0b53939a9819852cf88583720a82205933d20f7a28276')

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
