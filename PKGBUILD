# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=plasma5-applets-fanspeed-monitor-git
_pkgname=${pkgname%-git}
_repodir=plasma-applet-fanspeed-monitor
pkgver=r7.61be467
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. Monitors temperature of existing sensors including CPU, GPU and HDD."
arch=('any')
url="https://github.com/dwardor/plasma-applet-fanspeed-monitor"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/dwardor/plasma-applet-fanspeed-monitor.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${_repodir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_repodir}"

  mkdir -p build
  cd build
  rm -rf *

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${_repodir}"/build

  make install DESTDIR="${pkgdir}"
}
