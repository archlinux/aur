# Merged with official ABS kwin PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kwin-git
pkgver=6.4.80_r29185.ge1d01fef87
pkgrel=1
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(breeze-git gcc-libs glibc plasma-activities-git kauth-git kcmutils-git kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git kdeclarative-git kdecoration-git kglobalaccel-git kglobalacceld-git kguiaddons-git ki18n-git kidletime-git kirigami-git kitemmodels-git knewstuff-git knighttime-git knotifications-git kpackage-git kquickcharts-git kscreenlocker-git kservice-git ksvg-git kwayland-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git lcms2 libdisplay-info libdrm libepoxy libinput libpipewire libqaccessibilityclient-qt6-git libx11 libxcb libxcvt libxi libxkbcommon libxkbcommon-x11 mesa pipewire-session-manager python libplasma-git qt6-5compat qt6-base qt6-declarative qt6-multimedia qt6-sensors qt6-tools qt6-wayland systemd-libs wayland xcb-util-cursor xcb-util-keysyms xcb-util-wm)
makedepends=(git extra-cmake-modules-git kdoctools-git krunner-git plasma-wayland-protocols-git python wayland-protocols)
optdepends=('maliit-keyboard: virtual keyboard for kwin-wayland')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
install=${pkgname%-git}.install
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
