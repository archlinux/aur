# Merged with official ABS kactivities-stats PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=kactivities-stats-git
pkgver=5.79.0_r327.g62b208f
pkgrel=1
arch=($CARCH)
pkgdesc="A library for accessing the usage data collected by the activities system"
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kactivities-git)
makedepends=(git extra-cmake-modules-git boost doxygen qt5-tools qt5-doc)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf5-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "set(KF5\?_VERSION" CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
