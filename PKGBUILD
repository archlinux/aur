# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-weather-widget-git
_pkgname=plasma5-applets-weather-widget
_gitpkgname=plasma-applet-weather-widget
pkgver=r131.29e86a5
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. Shows weather information from yr.no server."
arch=('i686' 'x86_64')
url="https://github.com/kotelnik/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}" 'plasma-applet-weather-widget-git')
provides=("${_pkgname-*}")
source=("git+https://github.com/kotelnik/$_gitpkgname.git")
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "${_gitpkgname}"/build
  
  make install DESTDIR="${pkgdir}"
}
