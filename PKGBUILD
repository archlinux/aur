# Maintainer: Daniele <d bas dot so at poul.org>

pkgname="kontainer"
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple Kirigami GUI for Distrobox"
url="https://github.com/DenysMb/Kontainer"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'kirigami'
  'kirigami-addons'
  'kio'
  'qqc2-desktop-style'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

provides=("$pkgname")
conflicts=("$pkgname")

_pkgsrc="denysmb.kontainer"
source=("$_pkgsrc"::"git+$url.git")
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
  depends+=(
    'distrobox'
  )

  DESTDIR="$pkgdir" cmake --install build
}
