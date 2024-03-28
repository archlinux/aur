# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_distname=krunner
pkgname=${_distname}5
pkgver=5.115.0
pkgrel=3
pkgdesc='Framework for providing different actions given a string query'
arch=(x86_64)
url="https://invent.kde.org/frameworks/${_distname}"
license=('LGPL-2.0-or-later')
depends=(
  gcc-libs
  glibc
  kactivities5
  kconfig5
  kcoreaddons5
  ki18n5
  kio5
  kservice5
  plasma-framework5
  qt5-base
  qt5-declarative
  threadweaver5
)
makedepends=(
  doxygen
  extra-cmake-modules
  graphviz
  kdoctools5
  qt5-doc
  qt5-tools
)
conflicts=("${_distname}<5.111")
replaces=("${_distname}<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/"${pkgver%.*}"/"${_distname}"-"${pkgver}".tar.xz{,.sig})
b2sums=('bc50f60c87ea4b583702f76f7ab38065ffae34da454b999ccac82f197dd047e00bd7973bea7991b5f02740f0c88aa272fa111382448114ed03aff23e5a413bbb'
        'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org> TODO: signing key has expired, find newer one

build() {
  cmake -B build -S "${_distname}-${pkgver}" \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON \
    -Wno-dev               # no need to spam logs with verbose CMake dev warnings and info 
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
