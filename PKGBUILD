# Merged with official ABS systemsettings PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=systemsettings-git
pkgver=6.0.80_r3214.g001f3f75
pkgrel=1
pkgdesc='KDE system manager for hardware, software, and workspaces'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc plasma-activities-git kauth-git kcmutils-git kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kiconthemes-git kio-git kirigami-git kitemmodels-git kitemviews-git kjobwidgets-git krunner-git kservice-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules-git kdoctools-git)
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
