# Maintainer:
# Contributor: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: librewish <librewish at gmail dot com>

_pkgname="ksmoothdock"
pkgname="$_pkgname"
pkgver=6.3
pkgrel=4
pkgdesc='A cool desktop panel for KDE Plasma 5'
url='https://github.com/dangvd/ksmoothdock'
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'kactivities5'
  'kdbusaddons5'
  'kxmlgui5'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'python'
)

_pkgsrc="$_pkgname-${pkgver%%.r*}"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v${pkgver%%.r*}.$_pkgext")
sha256sums=('96eb9ce72ee4c44496c760c6bc9aa5e26b5cd3826729c112e7c81d2661effc02')

prepare() {
  cd "$_pkgsrc"
  sed '/add_compile_options/d' -i "src/CMakeLists.txt"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc/src"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
