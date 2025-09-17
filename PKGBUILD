# Maintainer:
# Contributor: Zren <zrenfire@gmail.com>

_pkgname="material-kwin-decoration"
pkgname="${_pkgname}-git"
pkgver=r215.38718de
pkgrel=3.2
pkgdesc="Material-ish window decoration for KWin, with LIM (Locally Integrated Menu) support"
url="https://github.com/guiodic/material-decoration"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  kcmutils
  'kdecoration>=6.4.0'
  'kwin-x11>=6.4.0'
  'plasma-x11-session'
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  kwin
  kwin-x11
)
optdepends=(
  'appmenu-gtk-module: gtk app support'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DQT_MAJOR_VERSION=6
    -DQT_VERSION_MAJOR=6
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
sha256sums=('SKIP')
