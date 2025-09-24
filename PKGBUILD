# Maintainer:

_pkgname="phonon-qt6-mpv"
pkgname="$_pkgname"
pkgver=0.1.0
pkgrel=4
pkgdesc="Phonon MPV backend for Qt6"
url="https://github.com/OpenProgger/phonon-mpv"
license=('LGPL-2.1-only')
arch=('x86_64')

depends=(
  'glibc'
  'mpv'
  'phonon-qt6'
)
makedepends=(
  'extra-cmake-modules'
  'ninja'
)

provides=('phonon-qt6-backend')

_pkgsrc="phonon-mpv-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('8cba7d803c23267bf7431bf79c4a65a03c767c01026a0cced18985bfa418a076')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DPHONON_BUILD_QT5=OFF
    -DPHONON_BUILD_QT6=ON
    -DBUILD_TESTING=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
