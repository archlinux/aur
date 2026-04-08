# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=fp
_pkgname=filterpath
pkgver=0.1.2
pkgrel=1
pkgdesc="fp (FilterPath) is the filter equivalent for the Unix test util"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/cyqsimon/fp"
license=("MIT")
depends=("libgcc")
makedepends=("cargo")
source=("${_pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('12e780714363c08383987a77e6fb219185c34e0e3d514d6f19248590723ef398c9cc395b1dba3f882982696b055cb3e65b43542ce99759639882f3f2a7ebf853')

prepare() {
  cd ${_pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${_pkgname}-${pkgver}
  cargo build --release --frozen --all-features
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/fp "${pkgdir}/usr/bin/fp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
