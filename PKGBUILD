# Maintainer: Manuel Schneider  <manuelschneid3r at googles mail>
pkgname=albert
pkgver=0.13.0
pkgrel=3
pkgdesc="A DE agnostic omnilauncher."
arch=('i686' 'x86_64')
url="https://github.com/albertlauncher/albert"
license=('GPL')
depends=('qt5-base' 'libx11' 'qt5-x11extras' 'qt5-svg')
makedepends=('cmake' 'qt5-base' 'qt5-tools')
optdepends=('virtualbox' 'muparser')
provides=('albert')
conflicts=('albert-git')
source=( git://github.com/albertlauncher/albert.git )
noextract=()
md5sums=('SKIP')

# If you want a debug build, change CMAKE_BUILD_TYPE to 'Debug'
#_build_type="Debug"
_build_type="Release"

prepare() {
  cd ${pkgname}
  git submodule update --init --recursive
}

build() {
  cat << EOD

   ╭──────────────────────────────────────────────╮
   │                                              │
   │   If you plan to report bugs please modify   │
   │   the PKGBUILD to build the debug version.   │
   │                                              │
   ╰──────────────────────────────────────────────╯

EOD

  [[ -d "build" ]] || mkdir -p "build"
  cd "build"

  cmake "../${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_build_type}
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir/" install | grep -v '^-- '
}

# vim:set ts=2 sw=2 et:
