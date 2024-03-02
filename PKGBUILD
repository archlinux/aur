# Merged with official ABS plasma-integration PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=plasma-integration-git
pkgver=6.0.80_r799.g9338c3c
pkgrel=3
pkgdesc="Qt Platform Theme integration plugins for the Plasma workspaces"
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcolorscheme-git kcompletion-git kconfig-git kcoreaddons-git kguiaddons-git kiconthemes-git ki18n-git kio-git kjobwidgets-git kservice-git kstatusnotifieritem-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libxcb libxcursor qqc2-breeze-style-git qqc2-desktop-style-git qt6-base qt6-declarative qt6-wayland wayland noto-fonts ttf-hack xdg-desktop-portal-kde)
makedepends=(git extra-cmake-modules-git plasma-wayland-protocols-git)
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
