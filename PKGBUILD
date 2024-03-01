# Merged with official ABS kactivities PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kactivities-git
pkgver=_r1466.gc68ff3db
pkgrel=1
arch=($CARCH)
pkgdesc="Core components for the KDE's Activities"
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(gcc-libs glibc kconfig-git kcoreaddons-git qt6-base)
makedepends=(git boost doxygen extra-cmake-modules-git qt6-declarative qt6-doc qt6-tools)
optdepends=('qt6-declarative: QML bindings')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
