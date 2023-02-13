# Merged with official ABS kpeople PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas 

pkgname=kpeople-git
pkgver=5.240.0_r1419.gce3d2f2
pkgrel=1
pkgdesc='A library that provides access to all contacts and the people who hold them'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons-git ki18n-git kwidgetsaddons-git kitemviews-git)
makedepends=(git extra-cmake-modules-git doxygen qt6-tools qt6-declarative)
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
