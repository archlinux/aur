# Maintainer: Zach Himsel <zach [at] himsel [dot] net>
# Contributor: Martchus <martchus@gmx.net>

pkgname=plasma5-applets-thermal-monitor-git
_pkgname=plasma5-applets-thermal-monitor
_gitpkgname=plasma-applet-thermal-monitor
pkgver=r109.b94c5a6
pkgrel=1
pkgdesc="Plasma 5 applet for monitoring CPU, GPU and other available temperature sensors"
arch=('any')
url="https://gitlab.com/agurenko/${_gitpkgname}"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'ksysguard')
optdepends=('lm_sensors')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+https://gitlab.com/agurenko/${_gitpkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitpkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_gitpkgname}"
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
