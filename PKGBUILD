# Merged with official ABS kactivities PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kactivities-git
pkgver=5.240.0_r1428.geb621d60
pkgrel=1
arch=($CARCH)
pkgdesc="Core components for the KDE's Activities"
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons-git kconfig-git kwindowsystem-git)
makedepends=(git extra-cmake-modules-git boost doxygen qt5-tools qt5-declarative)
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
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
