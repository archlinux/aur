# Merged with official ABS kalzium PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kalzium-git
pkgver=24.04.70_r4618.gb58a7959
pkgrel=2
pkgdesc='Periodic Table of Elements'
url='https://apps.kde.org/kalzium/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(avogadrolibs avogadrolibs-qt5 gcc-libs glibc kcompletion5 kconfig5 kconfigwidgets5 kcoreaddons5 ki18n5 kio5 kitemviews5 knewstuff5 kplotting5 ktextwidgets5 kwidgetsaddons5 kxmlgui5 kunitconversion5 openbabel qt5-base qt5-script qt5-svg zstd)
makedepends=(git eigen extra-cmake-modules-git facile kdoctools5 ocaml python)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-education-git)
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
