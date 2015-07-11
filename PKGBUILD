# Maintainer: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-thermal-monitor-git
_pkgname=plasma5-applets-thermal-monitor
_gitpkgname=plasma-applet-thermal-monitor
pkgver=r19.26dd85c
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. Monitors temperature of existing sensors including CPU, GPU and HDD."
arch=('any')
url="https://github.com/kotelnik/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
optdepends=('hddtemp: HDD temperature support'
            'gnu-netcat: querying hddtemp service')
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
