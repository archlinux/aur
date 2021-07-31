# Maintainer: Art Dev <artdevjs at gmail dot com>
pkgname=classikstyles
pkgver=2.6.breeze5.22.80
pkgrel=1
pkgdesc="A highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop. It provides the Classik, Kite, Oxygen/Breeze, and Redmond icon styles."
arch=($CARCH)
url="https://github.com/paulmcauley/classikstyles"
license=(GPL)
groups=(plasma)
depends=("frameworkintegration>=5.82" "kdecoration" "breeze-icons" "kwayland" "hicolor-icon-theme")
makedepends=("git" "cmake" "make" "gcc" "extra-cmake-modules" "kcmutils" "kdecoration" "qt5-declarative" "qt5-x11extras")
optdepends=('kcmutils-git: for breeze-settings')
provides=()
conflicts=()
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cd51527abf63127553e1c8ebb4a22cc2fb6b63c6f97bb2f3dd3251f2ab9b5bb4')

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
