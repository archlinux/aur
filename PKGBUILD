# Maintainer:
# Contributor: mi544 (sd32 at protonmail.com)

_pkgname="gummy"
pkgname="$_pkgname"
pkgver=0.6.0
pkgrel=1
pkgdesc="Screen brightness/temperature manager for Linux"
url="https://codeberg.org/fusco/gummy"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'ddcutil'
  'fmt'
  'libxcb'
  'sdbus-cpp'
  'spdlog'
  'systemd-libs'
  'xcb-util-image'
)
makedepends=(
  'cli11'
  'cmake'
  'git'
  'ninja'
  'nlohmann-json'
)

install="$_pkgname.install"

_pkgsrc="fusco.gummy"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('113d6511dc121e8f216c74ace8318976a27e4111177ea9b6f7270dece0a54f1d')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE='Release'
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib/$_pkgname"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
