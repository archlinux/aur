# Maintainer: Mohammed Bilal <bilalnsmuhammed@gmail.com>
_name=varnam-fcitx5
pkgname="${_name}-git"
pkgver=r12.b0d3d29
pkgrel=1
pkgdesc="Fcitx5 wrapper for Varnam input method"
arch=('x86_64')
url="https://www.varnamproject.com/"
license=('Custom')
makedepends=( 'git' 'cmake' 'extra-cmake-modules')
source=("git+https://github.com/varnamproject/varnam-fcitx5.git")
sha256sums=('SKIP')
depends=('fcitx5' 'fcitx5-configtool' 'govarnam' 'govarnam-schemes')
provides=('varnam-fcitx5')

pkgver() {
  cd ${_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_name} 
  cmake -B build/ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -S .
  cmake --build build/ --config Release
   
}

package() {
  cd ${_name} 
  DESTDIR=${pkgdir} cmake --install build/ --config Release  
}

