# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-whatfeatures
pkgver=0.9.12
pkgrel=1
pkgdesc="A cargo plugin to display features, versions and dependencies of crates."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/museun/cargo-whatfeatures"
license=("Apache" "MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('fb78aef0b3591d8e28f86abde9bb9ff68ac8e058a7ada52f069a9b882fef6dbc421b26bcab320fdcbecb29809beec1ed22f8d10583e48935f76ad616a96f6877')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  # rustls is faster
  cargo build --release --frozen --no-default-features --features "rustls"
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cargo-whatfeatures
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}
