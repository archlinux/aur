# Merged with official ABS neochat PKGBUILD by João, 2024/03/26 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: derfenix <derfenix@gmail.com>

pkgname=neochat-git
pkgver=24.04.70_r4287.gf7729063
pkgrel=1
pkgdesc='A client for matrix, the decentralized communication protocol'
url='https://apps.kde.org/neochat/'
arch=($CARCH)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(cmark gcc-libs glibc icu kcolorscheme-git kconfig-git kcoreaddons-git kdbusaddons-git ki18n-git kio-git kirigami-git kirigami-addons-git kitemmodels-git knotifications-git kquickcharts-git kquickimageeditor-git kstatusnotifieritem-git kwindowsystem-git libquotient prison-git qqc2-desktop-style-git qt6-base qt6-declarative qt6-location qt6-multimedia qt6-positioning qt6-webview qtkeychain-qt6 sonnet-git syntax-highlighting-git)
makedepends=(git extra-cmake-modules-git kdoctools-git python qcoro-qt6)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
