# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=mdserve
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast markdown preview server with live reload and theme support."
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/jfernandez/mdserve"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('ac19506b502f5c3f33c0e6c59a79a8442be03561637fd4acfea3aab1630331b6858b2f1f88703ace5a4fa370de901b1d726556855647c6788af39fb338c2942d')

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
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/mdserve
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
