# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-typify
_pkgname=typify
pkgver=0.4.1
pkgrel=1
pkgdesc="JSON schema to rust type code generator"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/oxidecomputer/typify"
license=("Apache-2.0")
depends=("gcc-libs")
makedepends=("cargo")
source=("${_pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('09efb35c38ebb1b914bb67ba60e676a19cecf793fc4e77c32cfa696e38cf5d78940d3f545d82a73efae202e9a74cb18e4e6de393072cf1e3ccd2226fc1d9c60b')

prepare() {
  cd ${_pkgname}-${pkgver}
  #cargo fetch --locked
  # temporary: lock file needs to be updated
  cargo fetch
}

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 -d "${pkgdir}/usr/bin/" target/release/cargo-typify
}
