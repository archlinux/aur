# Merged with official ABS kirigami2 PKGBUILD by João, 2021/02/05 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kirigami2-git
pkgver=5.240.0_r3647.g365210d4
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf6-git)
depends=(qt6-quickcontrols qt6-quickcontrols2 qt6-graphicaleffects)
makedepends=(git extra-cmake-modules-git qt6-tools qt6-svg kpackage-git doxygen)
conflicts=(${pkgname%-git} kirigami-git)
provides=(${pkgname%-git} kirigami-git)
source=("git+https://github.com/KDE/${pkgname%2-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%2-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%2-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

