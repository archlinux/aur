# Merged with official ABS kalzium PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kalzium-git
pkgver=23.11.70_r4557.g942f2f5a
pkgrel=1
pkgdesc='Periodic Table of Elements'
url='https://apps.kde.org/kalzium/'
arch=($CARCH)
license=(GPL LGPL FDL)
depends=(kparts5 knewstuff5 kplotting5 kunitconversion5 qt5-script avogadrolibs-qt5 openbabel hicolor-icon-theme)
makedepends=(git extra-cmake-modules-git kdoctools5 eigen ocaml facile python)
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
