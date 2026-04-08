# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=fp
_pkgname=filterpath
pkgver=0.1.1
pkgrel=1
pkgdesc="fp (FilterPath) is the filter equivalent for the Unix test util"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/cyqsimon/fp"
license=("MIT")
depends=("libgcc")
makedepends=("cargo")
source=("${_pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha512sums=('d3da95b9e41d7a692594f09aa8bfb6d4e519e662a4f81d10886f2e63170f5c9f61a66a5e40b139907c856d03c0ef384a6512902021cf3e30459110af4495a5de')

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
