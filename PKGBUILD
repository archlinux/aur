# Maintainer: Amolith <amolith@secluded.site>
pkgname=dotree
binname=dt
pkgdesc="A small, interactive command runner"
arch=("any")
url="https://github.com/KnorrFG/${pkgname}"
pkgver=0.8.2
pkgrel=2
license=("GPL-3.0")
makedepends=("cargo")
provides=($pkgname)
conflicts=($pkgname)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3957d7a1c4eb36fa8c577aa6d409b195e49dd0c5d3064c84ae75bdebc5a79c6d')
sha512sums=('b90999487eb2b2c6915e6f60bb854f210dcd697051f1352ec1d9316fd55da90a87f6263b6b30486588fe5c30c9f46165730dbff6442993b576dcea6b85ee0b79')
b2sums=('5f11dbb9f319f5fff2a262dc682577687c9b67bc4b16af6dc5a5b6dfb880f57b10b4efd6e08dc46c86d6dc58c2df3e9c0bea42062c3ded477c604578e98ab0fa')

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release --frozen --target-dir build
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/release/$binname" "$pkgdir/usr/local/bin/$binname"
}
