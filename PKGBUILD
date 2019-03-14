# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-flamegraph
pkgver=0.1.6
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/ferrous-systems/cargo-flamegraph"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/flamegraph/${pkgver}/download")
sha512sums=('77d72b92e93903ab1209054fb99deeb0f13cfb3bf8b9cae5a70542d7a2fd7c91ed10e22edfff4c70982cf4eba9bf558dc845b51e7c71168257adfa05384cff9f')

build() {
  cd "flamegraph-${pkgver}"
  # https://github.com/ferrous-systems/flamegraph/issues/25
  # --locked doesn't work
  #cargo build --release --locked
  cargo build --release
}

check() {
  cd "flamegraph-${pkgver}"
  # --locked doesn't work
  #cargo test --release --locked
  cargo test --release
}

package() {
  cd "flamegraph-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
