# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-thermal-monitor-git
_pkgname=plasma-applet-thermal-monitor
pkgver=r7.8b8a2ac
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. Monitors temperature of existing sensors including CPU, GPU and HDD."
arch=('any')
url="https://github.com/kotelnik/$_pkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("git://github.com/kotelnik/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  
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
  cd "${_pkgname}"/build
  
  make install DESTDIR="${pkgdir}"
}
