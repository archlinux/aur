# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.2.2
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
sha256sums=('8ef451a8e329a443440af11ef7353cd2e947115c19b26a49543a567422ad06bd')
b2sums=('7a889549cd60c4e172ec98b340060e038ac6ccd89f0d80f7a32ff46050e26d62eca34ee75baaa5e5cb324d09be79d77fe2881443de4a2dbd9f583e76e8ff2b0d')

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
