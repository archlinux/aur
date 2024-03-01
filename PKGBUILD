# Merged with official ABS kdiagram PKGBUILD by João, 2021/02/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdiagram-git
pkgver=3.0.1_r452.gc45626b
pkgrel=1
pkgdesc="Powerful libraries for creating business diagrams"
arch=($CARCH)
url="https://www.kde.org/"
license=(GPL2)
depends=(gcc-libs glibc qt6-base qt6-svg)
makedepends=(git doxygen extra-cmake-modules-git git qt6-doc qt6-tools)
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
