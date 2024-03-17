# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-whatfeatures
pkgver=0.9.10
pkgrel=1
pkgdesc="A cargo plugin to display features, versions and dependencies of crates."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/museun/cargo-whatfeatures"
license=("Apache" "MIT")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('d2988f4d024e85edba67e38da31e8630636583052808b9ef4749d323ca03348c5b87df89eb6e0cdc3fdd47e670162a9324244c0b20ae9a332d13325b737c3f9a')

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
