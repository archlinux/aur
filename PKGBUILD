# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-weather-widget-git
_pkgname=plasma5-applets-weather-widget
_gitpkgname=plasma-applet-weather-widget
pkgver=r22.8ea83c6
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. Shows weather information from yr.no server."
arch=('any')
url="https://github.com/kotelnik/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git://github.com/kotelnik/$_gitpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitpkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitpkgname}"
  
  mkdir -p build
  cd build
  rm -rf *
  
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "${_gitpkgname}"/build
  
  make install DESTDIR="${pkgdir}"
}
