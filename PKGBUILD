# Merged with official ABS kirigami2 PKGBUILD by João, 2021/02/05 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kirigami2-git
pkgver=5.116.0_r3814.gbff8d7e3
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(git extra-cmake-modules-git qt5-tools qt5-doc qt5-svg kpackage5 doxygen)
groups=(kf5-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%2-git}.git")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname%2-git}
  git checkout kf5
}

pkgver() {
  cd ${pkgname%2-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%2-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

