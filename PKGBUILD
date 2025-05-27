# Maintainer:
# Contributor: Kazel <address at domain dot tld>

_pkgname="klevernotes"
pkgname="$_pkgname"
pkgver=1.2.2
pkgrel=4
pkgdesc="A convergent markdown note taking application"
url="https://invent.kde.org/office/klevernotes"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'kcolorscheme'
  'kconfig'
  'kcoreaddons'
  'ki18n'
  'kiconthemes'
  'kio'
  'kirigami'
  'qt6-base'
  'qt6-declarative'
  'qt6-webchannel'
  'qt6-webengine'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)

_pkgsrc="$_pkgname-v$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/-/archive/v${pkgver}/$_pkgsrc.$_pkgext")
sha256sums=('SKIP')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
