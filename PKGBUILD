# Merged with official ABS step PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=step-git
pkgver=24.04.70_r1422.gbe025ee
pkgrel=2
pkgdesc='Interactive Physical Simulator'
url='https://apps.kde.org/step/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc gsl kcompletion5 kconfig5 kconfigwidgets5 kcoreaddons5 kcrash5 ki18n5 kiconthemes5 kio5 kjobwidgets5 knewstuff5 kplotting5 ktextwidgets5 kwidgetsaddons5 kxmlgui5 libqalculate qt5-base)
makedepends=(git eigen extra-cmake-modules-git kdoctools5 python qt5-tools)
arch=($CARCH)
groups=(kde-applications-git kde-education-git)
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
