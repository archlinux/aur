# Merged with official ABS okteta PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=okteta-git
pkgver=0.26.60_r5029.g621f761ba
pkgrel=1
pkgdesc='KDE hex editor for viewing and editing the raw data of files'
url='https://kde.org/applications/utilities/okteta/'
license=(GPL LGPL FDL)
depends=(gcc-libs glibc kcmutils5-git kcodecs5-git kcompletion5-git kconfig5-git kconfigwidgets5-git kcoreaddons5-git kcrash5-git kdbusaddons5-git ki18n5-git kiconthemes5-git kio5-git kjobwidgets5-git knewstuff5-git kparts5-git kservice5-git kwidgetsaddons5-git kxmlgui5-git qca-qt5-git qt5-base qt5-declarative qt5-script)
makedepends=(git extra-cmake-modules-git kdoctools5-git qt5-tools)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "project(Okteta VERSION" CMakeLists.txt | cut -d ' ' -f3 | tr -d ')' | tr - .)"
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
