# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.2.3
pkgrel=2
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs'
  'lz4' 'xz' 'zstd'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
makedepends=('cmake' 'sparsehash' 'ruby-ronn' 'boost' 'libevent')
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}.tar.bz2")
sha256sums=('c77f6b65572e000d5b78cad167a66fbe6a802715da5e68613bcb2be5a4d30030')
b2sums=('e39336f69fe64bc29c004560b3b46f59a1f55fa403c8324e7b96c36b73b52f21f8b4b3dee67f98df6f16c6da780aa93f622713478e44dbbebb1f82b71cbe659b')

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
