# Merged with official ABS libksysguard PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libksysguard-git
pkgver=6.0.80_r2850.gdd31c3a5
pkgrel=1
pkgdesc='Library to retrieve information on the current status of computer hardware'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kauth-git kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kdeclarative-git kglobalaccel-git ki18n-git kio-git kitemmodels-git kjobwidgets-git knewstuff-git kpackage-git kquickcharts-git kservice-git kwidgetsaddons-git kwindowsystem-git libnl libpcap libx11 libxres lm_sensors qt6-base qt6-declarative qt6-webchannel qt6-webengine solid-git zlib)
makedepends=(git extra-cmake-modules-git qt6-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
