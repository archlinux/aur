# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-flamegraph
pkgver=0.1.11
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/ferrous-systems/cargo-flamegraph"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ferrous-systems/flamegraph/archive/${pkgver}.tar.gz")
sha512sums=('115edb277babad162a8eb75e20c1472edde0f4d9ecf6b83f2f3fd59ecfe3bbffdd02fc7ad1a9688d3b5da8139c64bbcf4e449205a25a913bb58c7cfcfacd00f2')

build() {
  cd "flamegraph-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "flamegraph-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "flamegraph-${pkgver}"
  install -Dm755 \
    "target/release/cargo-flamegraph" \
    "target/release/flamegraph" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
