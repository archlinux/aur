# Maintainer: Adam Brenner <adam@aeb.io>
pkgname='libfds'
pkgver='0.5.0'
pkgrel=1
pkgdesc='Flow Data Storage library'
url='https://github.com/CESNET/ipfixcol2'
arch=('x86_64')
license=('LicenseRef-CESNET')
depends=('libxml2' 'lz4' 'zstd' 'gcc-libs' 'glibc')
makedepends=('cmake')
source=("https://github.com/CESNET/libfds/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30b13b84668961192d9ea2326bdf02c9842b688574dac8af9fdfcfca29354b4b')

build() {

  local cmake_options=(
    -B build
    -S ${pkgname}-${pkgver}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D ENABLE_DOC=OFF
    -D USE_SYSTEM_LZ4=ON
    -D USE_SYSTEM_ZSTD=ON
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd "${pkgname}-${pkgver}"
  # license
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}