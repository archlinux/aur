# Merged with official ABS libksysguard PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libksysguard-git
pkgver=5.21.80_r2048.gc3de4a9
pkgrel=1
pkgdesc='Library to retrieve information on the current status of computer hardware'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(libxres qt5-webengine kdeclarative-git knewstuff-git)
makedepends=(git extra-cmake-modules-git kdoctools-git qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
