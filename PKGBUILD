# Merged with official ABS okteta PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=okteta-git
pkgver=0.26.60_r5052.g8d58c1543
pkgrel=1
pkgdesc='KDE hex editor for viewing and editing the raw data of files'
url='https://kde.org/applications/utilities/okteta/'
license=(GPL LGPL FDL)
depends=(gcc-libs glibc kcmutils-git kcodecs-git kcompletion-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kiconthemes-git kio-git kjobwidgets-git knewstuff-git kparts-git kservice-git kwidgetsaddons-git kxmlgui-git qca-qt6-git qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules-git kdoctools-git qt6-tools)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git#branch=work/kossebau/kf6")
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
