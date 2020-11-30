# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs'
  'lz4' 'xz' 'zstd'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
makedepends=('cmake' 'sparsehash')
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}.tar.bz2")
sha256sums=('f3d2a242dbd2d6e8422b7e6bf01d9ea33a9f06110ee77b3150709d30a122ea1a')
b2sums=('aae378cd17e7f47138dcb84b31e30b8909c2618ea93544035c14dd878d38e0732040c0ff1bfb1062d464c944d32af28e39ea2e8bc8a767766a279429ecf5a44c')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None

  cmake --build build
}

package() {
  cmake --install build \
    --prefix "${pkgdir}/usr"

  install -Dm0644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
