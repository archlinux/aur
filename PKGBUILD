# Merged with official ABS knotifications PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=knotifications-git
pkgver=5.79.0_r609.g61a0e6e
pkgrel=1
pkgdesc='Abstraction for system notifications'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(libcanberra libdbusmenu-qt5 kwindowsystem-git kconfig-git kcoreaddons-git qt5-speech libxtst)
makedepends=(git extra-cmake-modules-git qt5-tools qt5-doc doxygen)
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
