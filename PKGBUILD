# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=classik
pkgver=3.0.breeze5.23.80
pkgrel=1
pkgdesc='ClassiK is a highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop. It provides the Classik, Kite, Oxygen/Breeze, and Redmond icon styles.'
arch=($CARCH)
url="https://github.com/paulmcauley/classik"
license=(GPL)
replaces=('classikstyles')
depends=("frameworkintegration>=5.86" "kdecoration" "kwayland")
makedepends=("git" "cmake" "make" "gcc" "extra-cmake-modules" "kcmutils" "kdecoration" "qt5-declarative" "qt5-x11extras")
optdepends=('kcmutils: for classik-settings')
provides=()
conflicts=()
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8258b06639e698b7e8a608afafae321574d911354b4dcc5043a1aab5929b18b4')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
