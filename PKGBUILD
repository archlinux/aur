# Maintainer:

_pkgname="mapbox-gl-qml"
pkgname="$_pkgname"
pkgver=3.0.0
pkgrel=1
pkgdesc="Mapbox GL Native bindings for Qt QML"
url="https://github.com/rinigus/mapbox-gl-qml"
license=('LGPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'maplibre-native' # AUR
  'qt5-location'
  'qt5-svg'
)
makedepends=(
  'cmake'
  'ninja'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('fa538a42b70eee0ccdcae6512a7b7b3f03eeac58e0f8cce00cb581b0ff937077')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
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
  DESTDIR="$pkgdir" cmake --install build
}
