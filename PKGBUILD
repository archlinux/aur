# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ccase
pkgver=0.2.0
pkgrel=1
pkgdesc="A command line utility to convert to and from various cases"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rutrum/convert-case"
license=("MIT")
conflicts=("ccase-git" "ccase-bin")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('0b4eb702655a54157406187f18d491def2a7508baef3290175b43e836b2ee8a8')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked --target="${CARCH}-unknown-linux-gnu"
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/ccase "${pkgdir}/usr/bin/ccase"
  # Awaiting https://github.com/rutrum/convert-case/issues/7
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
