# Maintainer: kpcyrd <git@rxv.cc>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=cargo-flamegraph
pkgver=0.4.0
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/flamegraph-rs/flamegraph"
depends=('gcc-libs' 'perf')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("flamegraph-$pkgver.tar.gz::https://static.crates.io/crates/flamegraph/flamegraph-$pkgver.crate")
b2sums=('b02de682be9ad19ea193173ff886ece80ebe67eced3bb322dae75eede80b766e518dc8120ee062b3dcaafdf288ca0f884f961185e3f14978420bcca11125742b')

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
