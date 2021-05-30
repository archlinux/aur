# Merged with official ABS powerdevil PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=powerdevil-git
pkgver=5.22.80_r2436.gf66333c5
pkgrel=1
pkgdesc='Manages the power consumption settings of a Plasma Shell'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(plasma-workspace-git bluez-qt-git networkmanager-qt-git)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kinfocenter-git: for the Energy Information KCM')
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
