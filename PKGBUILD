# Merged with official ABS kholidays PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kholidays-git
pkgver=5.79.0_r904.g0131570
pkgrel=1
epoch=1
pkgdesc="KDE library for regional holiday information"
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-base)
makedepends=(git extra-cmake-modules-git qt5-declarative qt5-tools qt5-doc doxygen)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('qt5-declarative: QML bindings')
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
