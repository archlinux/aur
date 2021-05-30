# Merged with official ABS bluez-qt PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bluez-qt-git
pkgver=5.83.0_r659.ga9b57fe
pkgrel=1
pkgdesc='Qt wrapper for Bluez 5 DBus API'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(GPL2)
depends=(qt5-base bluez)
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
    -DUDEV_RULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
