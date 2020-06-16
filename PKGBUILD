# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=plasma5-applets-thermal-monitor-git
_pkgname=plasma5-applets-thermal-monitor
_gitpkgname=plasma-applet-thermal-monitor
pkgver=r85.7835369
pkgrel=1
pkgdesc="Plasma 5 applet for monitoring CPU, GPU and other available temperature sensors"
arch=('any')
url="https://github.com/kotelnik/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+https://github.com/kotelnik/$_gitpkgname.git")
sha256sums=('SKIP')

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
