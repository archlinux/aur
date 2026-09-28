# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=paq8px
pkgver=217
pkgrel=1
pkgdesc="Lossless data compressor achieving high compression ratios"
arch=('x86_64')
url="https://github.com/hxim/paq8px"
license=('GPL-2.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hxim/paq8px/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d00abfbc46cd926e88e37698abbb743267e53c282dec9ab21b31dde8f9314a58')

latestver() {
  gh api repos/hxim/paq8px/releases/latest --jq '.tag_name' | sed 's/^v//'
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DNDEBUG=ON \
    -DNATIVECPU=OFF
  cmake --build build
}

package() {
  install -Dm755 build/paq8px "${pkgdir}/usr/bin/paq8px"
}
