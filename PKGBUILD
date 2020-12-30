# Maintainer: BrainDamage

pkgname=synapse-compress-state
pkgver=0.1.0
pkgrel=2
pkgdesc="A tool to compress some state in a Synapse instance's database "
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/matrix-org/rust-synapse-compress-state"
makedepends=('rust')
license=('Apache')
source=("${pkgname}-${pkgver}::https://github.com/matrix-org/rust-synapse-compress-state/archive/v${pkgver}.tar.gz")
sha256sums=('ac57d264a99157174cfb6564cb12ef9453229ec5771e57cd990f3eb78efdb1b1')

build() {
	cd "${srcdir}/rust-${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
  cargo install --locked --path "${srcdir}/rust-${pkgname}-${pkgver}" --root "${pkgdir}/usr"
  # delete the leftover crates file
  rm -f "${pkgdir}/usr/.crates.toml" "${pkgdir}/usr/.crates2.toml"
}
