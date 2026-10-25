# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=simdzone
pkgver=0.2.8
pkgrel=1
pkgdesc='Fast and standards compliant DNS presentation format parser'
arch=('x86_64')
url="https://github.com/NLnetLabs/${pkgname}"
license=('BSD')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c7c3ee7da711d3caf1c44eea8ba9ae28e824fd864f2623765da4b193e0db73c')

build() {
  local cmake_options=(
    -B build
    -S "${pkgname}-${pkgver}"
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm755 build/zone-bench "${pkgdir}"/usr/bin/zone-bench
  install -Dm644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
