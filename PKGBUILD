# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-flamegraph
pkgver=0.2.0
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/ferrous-systems/cargo-flamegraph"
depends=('gcc-libs' 'perf')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/ferrous-systems/flamegraph/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('fae15f850540661c46d7a7243a44ff85e818912a34a60b3e8ca3ecf663f5d634463556334d2c1e6fc15abef3c8de85a4efeec006f69eb4470ec1eae29a050bd2')

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
