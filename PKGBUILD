# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=kongress-git
pkgver=1.0_r162.gf5eceec
pkgrel=1
pkgdesc="Companion application for conferences"
arch=($CARCH)
url="https://github.com/KDE/kongress"
license=(BSD GPL LGPL)
depends=(hicolor-icon-theme kcalendarcore-git kdbusaddons-git ki18n-git knotifications-git)
makedepends=(git extra-cmake-modules kconfig-git kcoreaddons-git kirigami2-git qt5-base qt5-declarative qt5-imageformats qt5-quickcontrols2 qt5-svg qt5-wayland qt5-webengine)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "project(${pkgname%-git} VERSION" CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
