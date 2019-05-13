# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-crev
pkgver=0.7.0
pkgrel=1
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
url="https://github.com/dpc/crev"
depends=('openssl' 'curl')
makedepends=('cargo' 'clang')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MPL' 'Apache' 'MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpc/crev/archive/cargo-crev-v${pkgver}.tar.gz")
sha512sums=('5dfaf5d89780137fcba31a8184ccb61782b778b918fca019bbc849a006b6ee1ae6cf85e98a8f00eabd49ee413d33f40634f49950c217ccfe9eb01e43131a74c9')

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
