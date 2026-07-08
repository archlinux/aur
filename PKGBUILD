# Maintainer: aur.chaotic.cx
# Contributor: archlinux.info:tdy

_pkgname="cutechess"
pkgname="$_pkgname"
pkgver=1.5.1
pkgrel=1
pkgdesc="Tools for working with chess engines"
url="https://github.com/cutechess/cutechess"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'qt6-5compat'
  'qt6-base'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'doxygen'
  'ninja'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('063f94f8a421952487cc49acddd218962c3881bfdf0219ad8f159954678fb375')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DWITH_TESTS=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
