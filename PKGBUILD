# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-flamegraph
pkgver=0.1.12
pkgrel=1
pkgdesc="Cargo plugin that generates a flamegraph for a given workload"
url="https://github.com/ferrous-systems/cargo-flamegraph"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ferrous-systems/flamegraph/archive/${pkgver}.tar.gz")
sha512sums=('36f38da5f331ed7d5ebc2e5255c392be7d60ab9da3d18d560fafc5fe8e9fc88cd2d04eafb9e0f834cda74e940f59db9349990e955c445d1484a6472ecb731856')

build() {
  # --locked broke in 0.1.12
  cd "flamegraph-${pkgver}"
  #cargo build --release --locked
  cargo build --release
}

check() {
  cd "flamegraph-${pkgver}"
  #cargo test --release --locked
  cargo test --release
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
