# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=rng-rename
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI tool to rename files to randomly generated strings."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/cyqsimon/rng-rename"
license=("AGPL3")
conflicts=("rng-rename-git" "rng-rename-bin")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dd02b779800f5ccdd1eddad05e000ad249f46dedade95e11a6659852980a72f7')

prepare() {
  cd ${pkgname}-${pkgver}
  #cargo update
  cargo fetch --locked --target="${CARCH}-unknown-linux-gnu"
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen --all-features --target-dir="target"
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/rng-rename "${pkgdir}/usr/bin/rng-rename"
}
