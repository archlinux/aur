# Maintainer:

_pkgname="mapbox-gl-qml"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=2.1.1
pkgrel=2
pkgdesc="Mapbox GL Native bindings for Qt QML"
url="https://github.com/rinigus/mapbox-gl-qml"
license=(LGPL3)
arch=(x86_64 aarch64)

depends=(
  'maplibre-native'
  'qt5-location'
  'qt5-svg'
)
makedepends=(
  'cmake'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext"
)
sha256sums=(
  '1a5e3369832e5d71b13db42d86cfd24ffe4573f8a8732fda6fea3e05a3417d43'
)


build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'

    -DUSE_CURL_SSL=OFF

    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
