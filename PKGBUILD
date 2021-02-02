# Merged with official ABS mailcommon PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=mailcommon-git
pkgver=5.16.40_r988.g87f2d8d
pkgrel=1
pkgdesc="KDE PIM library providing support for mail applications"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL)
depends=(mailimporter-git messagelib-git phonon-qt5)
makedepends=(git extra-cmake-modules-git boost qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kdepim-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
