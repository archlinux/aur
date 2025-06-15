# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-autoinherit
pkgver=0.1.6
pkgrel=2
pkgdesc="(Auto)DRY for your Rust dependencies"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/mainmatter/cargo-autoinherit"
license=("Apache-2.0 OR MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('d4c6119c4608556131784727f11c28283de50ea787c8686ef2956da2687559a4a82fc69de09cf9caa5d400954111970528cc5ecc8081d4a896e43e99a73cb613')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/cargo-autoinherit
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-MIT
}
