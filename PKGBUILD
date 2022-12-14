# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ccase
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line utility for converting between string cases"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rutrum/ccase"
license=("MIT")
conflicts=("ccase-git" "ccase-bin")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('dbe54f9609ef0677623b86acb3a9d0ea9b21ac6d367aff3f5d5949f95cf7b59db4915afe71af92cc034c3b3261c64f7a3699a14968cc866f76ce3cae586b1f38')

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
  install -Dm755 target/release/ccase "${pkgdir}/usr/bin/ccase"
  # Awaiting https://github.com/rutrum/ccase/issues/1
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
