# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=autocast
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to help automate the creation of terminal demos."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/k9withabone/autocast"
license=("GPL-3.0-or-later")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('ded7ee2161dec5aacf5e6c68ec43cda4969dce61c4da389677e4d62d6ac6e1e90b8203f7f48a3bea7beb3d398af57a5c3fa8ffd2d630f12d5f2d58680bc073c9')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/autocast
}
