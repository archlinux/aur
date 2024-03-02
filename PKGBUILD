# Merged with official ABS plasma-nm PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-nm-git
pkgver=6.0.80_r3957.g97358ae9
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(gcc-libs glib2 glibc kcmutils-git kcolorscheme-git kcompletion-git kconfig-git kcoreaddons-git kdbusaddons-git kdeclarative-git ki18n-git kio-git kirigami-git knotifications-git kquickcharts-git ksvg-git kwallet-git kwidgetsaddons-git kwindowsystem-git libnm libplasma-git modemmanager-qt-git networkmanager-qt-git plasma-workspace-git prison-git qca-qt6-git qcoro-qt6 qt6-base qt6-declarative solid-git)
makedepends=(git extra-cmake-modules-git openconnect)
optdepends=('openconnect: Cisco AnyConnect VPN plugin'
            'qt6-webengine: Cisco AnyConnect VPN plugin')
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
