# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-udeps
pkgver=0.1.11
pkgrel=1
pkgdesc="Cargo plugin to find unused dependencies in Cargo.toml "
url="https://github.com/est31/cargo-udeps"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/est31/cargo-udeps/archive/v${pkgver}.tar.gz)
sha512sums=('590547ba7c88c5ebe2dad34f83198dff828f9b13ea98d15400a822e652b880b513a6b0bd7dae813b9ba1ea1d2a7b4207344694552f8542873eb5bd52eeac7bb8')

build() {
  cd "cargo-udeps-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "cargo-udeps-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "cargo-udeps-${pkgver}"
  install -Dm755 \
    "target/release/cargo-udeps" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
