# Merged with official ABS krunner PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=krunner-git
pkgver=5.79.0_r569.geaaf2ca
pkgrel=1
pkgdesc='Framework for providing different actions given a string query'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5-git)
depends=(plasma-framework-git threadweaver-git)
makedepends=(git extra-cmake-modules-git kdoctools-git doxygen qt5-tools qt5-doc)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
