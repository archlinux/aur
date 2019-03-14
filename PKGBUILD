# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-flamegraph
pkgver=0.1.10
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/ferrous-systems/cargo-flamegraph"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/flamegraph/${pkgver}/download")
sha512sums=('9afdd7b5739f128fcfd9e3b5aa77d7694b1e2d6086444843a0da17a87da27dc0e7b57f4b41a2e021e59f5bcafc8298b540f78a26e45be41c4dfd27cc683969d0')

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
