# Maintainer: Xaver Maierhofer <devel + aur at xwissen dot info>

pkgname=plasma5-applets-hoppla-sa-git
_pkgname=plasma5-applets-hoppla-sa
_gitpkgname=hoppla-sa
pkgver=4.0.0.r0.g53de161
pkgrel=1
pkgdesc="Plasmoid for Plasma 5 for controlling Phillips Hue lights"
arch=('any')
url="https://github.com/Fuchs/$_gitpkgname"
license=('LGPL-2.1')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+https://github.com/Fuchs/$_gitpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitpkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitpkgname}"

  mkdir -p build
  cd build
  rm -rf *

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "${_gitpkgname}"/build

  make install DESTDIR="${pkgdir}"
}
