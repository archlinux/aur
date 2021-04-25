# Merged with official ABS kdiagram PKGBUILD by João, 2021/02/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=kdiagram-git
pkgver=2.7.90_r297.gd5089ef
pkgrel=1
pkgdesc="Powerful libraries for creating business diagrams"
arch=($CARCH)
url="https://www.kde.org/"
license=(GPL2)
depends=(qt5-svg)
makedepends=(git extra-cmake-modules-git qt5-tools qt5-doc doxygen)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
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
