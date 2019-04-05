# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-flamegraph
pkgver=0.1.13
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/ferrous-systems/cargo-flamegraph"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ferrous-systems/flamegraph/archive/${pkgver}.tar.gz")
sha512sums=('0d035257f835744cd3b24a84b4b602eb20a333df6ea32b0c5641f17d4fcb270d54365d245b8fbd5e4e1adf1f97a36974509e12e5a9625a2d670c215d8cf7b801')

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
