# Merged with official ABS okteta PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=okteta-git
pkgver=0.26.60_r5033.g4a8d1cd19
pkgrel=1
pkgdesc='KDE hex editor for viewing and editing the raw data of files'
url='https://kde.org/applications/utilities/okteta/'
license=(GPL LGPL FDL)
depends=(gcc-libs glibc kcmutils5 kcodecs5 kcompletion5 kconfig5 kconfigwidgets5 kcoreaddons5 kcrash5 kdbusaddons5 ki18n5 kiconthemes5 kio5 kjobwidgets5 knewstuff5 kparts5 kservice5 kwidgetsaddons5 kxmlgui5 qca-qt5-git qt5-base qt5-declarative qt5-script)
makedepends=(git extra-cmake-modules-git kdoctools5 qt5-tools)
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
