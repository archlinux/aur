# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: zinzila
# Contributor: Javier Jardón <jjardon@gnome.org>

pkgname=dlt-viewer
pkgdesc='Diagnostic Log and Trace client viewer'
pkgver=2.28.0
pkgrel=1
url='https://github.com/GENIVI/dlt-viewer'
arch=(x86_64 i686)
license=('MPL-2.0')
makedepends=('cmake')
depends=('qt6-base' 'qt6-serialport')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('4120e500201944f6249a79c350afe81d0ceb0093d6217afadc9b5f703e4ee65c54c331c9e995c202bb456f018e2092e3005b5e2020f416ae1e78b5f326db5d5a')

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D DLT_USE_STANDARD_INSTALLATION_LOCATION=ON
    -Wno-dev
  )
  cmake -B build -S "dlt-viewer-${pkgver}" "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
