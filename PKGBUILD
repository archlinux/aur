# Merged with official ABS khotkeys PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=khotkeys-git
pkgver=5.21.80_r2056.gd4d9c45
pkgrel=1
pkgdesc='KHotKeys'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(plasma-workspace-git)
makedepends=(git extra-cmake-modules-git kdoctools-git kdesignerplugin-git kinit-git)
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
