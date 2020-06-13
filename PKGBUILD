# Maintainer: kpcyrd <git@rxv.cc>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=cargo-flamegraph
pkgver=0.3.0
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/flamegraph-rs/flamegraph"
depends=('gcc-libs' 'perf')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/flamegraph-rs/flamegraph/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d3e9114b79ed296ecf472e317844aa314e3619e3253c81a2eb2681ec389e587d11307ac55a886008e5ec2ec9ccdee563213907687fddb59148db0ad4fe4cef2f')

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
