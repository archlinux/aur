# Merged with official ABS kdeplasma-addons PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefano Avallone <stavallo@gmail.com>

pkgname=kdeplasma-addons-git
pkgver=6.0.80_r10014.g28db01d63
pkgrel=1
pkgdesc='All kind of addons to improve your Plasma experience'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc icu kcmutils-git kconfig-git kcoreaddons-git kdeclarative-git kglobalaccel-git kholidays-git ki18n-git kiconthemes-git kio-git kirigami-git kirigami-addons-git kitemmodels-git kjobwidgets-git knewstuff-git knotifications-git kpackage-git krunner-git kservice-git ksvg-git kunitconversion-git kwidgetsaddons-git kwin-git kwindowsystem-git kxmlgui-git libplasma-git plasma-workspace-git plasma5support-git qt6-5compat qt6-base qt6-declarative sonnet-git)
makedepends=(git extra-cmake-modules-git networkmanager-qt-git qt6-webengine)
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
