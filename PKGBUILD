# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.2.4
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
makedepends=('cmake' 'sparsehash' 'ruby-ronn' 'boost' 'libevent')
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/mhx/dwarfs/releases/download/v${pkgver}/dwarfs-${pkgver}.tar.bz2")
sha256sums=('68b02c4fafbcc274489b789e272d727dc345a224fe7590efb65488daab104d83')
b2sums=('08ed8aad5efced3b0132dd09228530c01a556e87daaf543ca1e4565aaaabac3294f2b3816a1bd3f52b09215b560efcd4f5a8b5ff71909dd45e7011be133e9986')

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
