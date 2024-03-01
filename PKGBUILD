# Merged with official ABS kscreenlocker PKGBUILD by João, 2021/04/20 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Marcin Mikołajczak <me@mkljczk.pl>

pkgname=kscreenlocker-git
pkgver=6.0.80_r1288.g2c17bd6
pkgrel=2
pkgdesc='Library and components for secure lock screen architecture'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kconfig-git kcoreaddons-git kcrash-git kdeclarative-git kglobalaccel-git ki18n-git kidletime-git kio-git kirigami-git knotifications-git kpackage-git ksvg-git kwindowsystem-git kxmlgui-git layer-shell-qt-git libkscreen-git libx11 libxcb libxi pam libplasma-git qt6-base qt6-declarative wayland xcb-util-keysyms)
makedepends=(git extra-cmake-modules-git kcmutils-git kdoctools-git)
optdepends=('kcmutils: configuration module')
groups=(plasma-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
