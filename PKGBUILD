# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=openraider-git
pkgver=0.1.4.r15.g6790d48
pkgrel=1
pkgdesc="Open Source Tomb Raider Engine (development version)"
arch=('i686' 'x86_64')
url="https://github.com/xythobuz/OpenRaider/"
license=('GPL3')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver%.r*}")
makedepends=('git')
depends=('sdl2' 'freealut' 'glbinding')
install="${pkgname%-*}.install"
source=(${pkgname%-*}::"git+https://github.com/xythobuz/OpenRaider.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --tags --long | sed 's/-20[0-9]*-/.r/;s/-/./'
}

prepare() {
  cd ${pkgname%-*}

  rm -rf build
  mkdir build
}

build () {
  cd ${pkgname%-*}/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package () {
  make -C ${pkgname%-*}/build DESTDIR="$pkgdir/" install
}
