# Merged with official ABS kpeople PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas 

pkgname=kpeople-git
pkgver=5.83.0_r1319.gad1afe3
pkgrel=1
pkgdesc='A library that provides access to all contacts and the people who hold them'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons-git ki18n-git kwidgetsaddons-git kitemviews-git)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools qt5-declarative)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('qt5-declarative: QML bindings')
groups=(kf5-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF5\?_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
