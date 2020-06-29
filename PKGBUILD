# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=plasma5-applets-fanspeed-monitor-git
_pkgname=${pkgname%-git}
_repodir=plasma-applet-fanspeed-monitor
pkgver=r7.61be467
pkgrel=2
pkgdesc="Plasmoid for Plasma 5. Monitors temperature of existing sensors including CPU, GPU and HDD."
arch=('any')
url="https://github.com/dwardor/plasma-applet-fanspeed-monitor"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/dwardor/plasma-applet-fanspeed-monitor.git#branch=master"
        "0001-Fix-Plasmashell-crash-when-opening-config.patch")
sha256sums=('SKIP'
            'f2e84c0201f401c04668f78e315530909d2f076460a2b553b6f4bdabdd411872')

pkgver() {
  cd "${_repodir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_repodir}"
    patch -p1 -i ../0001-Fix-Plasmashell-crash-when-opening-config.patch
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
