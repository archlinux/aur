# Merged with official ABS kdepim-runtime PKGBUILD by João, 2021/07/19 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdepim-runtime-git
pkgver=21.11.40_r15147.g4b24843e0
pkgrel=1
pkgdesc='Extends the functionality of kdepim'
arch=($CARCH)
url='https://kontact.kde.org'
license=(GPL LGPL FDL)
depends=(libkolabxml kdav-git akonadi-calendar-git knotifyconfig-git kalarmcal-git kmbox-git pimcommon-git akonadi-notes-git akonadi-git qca qt5-networkauth)
makedepends=(git extra-cmake-modules-git kdoctools-git boost)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(RELEASE_SERVICE_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  _ver=${_ver:-"$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"}
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
