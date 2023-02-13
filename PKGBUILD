# Merged with official ABS kholidays PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kholidays-git
pkgver=5.240.0_r1105.g9d961eb
pkgrel=1
epoch=1
pkgdesc="KDE library for regional holiday information"
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt6-base)
makedepends=(git extra-cmake-modules-git qt6-declarative qt6-tools doxygen)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('qt6-declarative: QML bindings')
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
