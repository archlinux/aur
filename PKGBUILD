# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=simdzone
pkgver=0.2.7
pkgrel=1
pkgdesc='Fast and standards compliant DNS presentation format parser'
arch=('x86_64')
url="https://github.com/NLnetLabs/${pkgname}"
license=('BSD')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93c46ecbe87eb0d49ea9b4850d8dc42d903c76bcb59796681916b60db1ebb812')

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
