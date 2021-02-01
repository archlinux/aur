# Merged with official ABS syntax-highlighting PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=syntax-highlighting-git
pkgver=5.79.0_r1492.g064912cb
pkgrel=1
pkgdesc='Syntax highlighting engine for structured text and code'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(GPL2)
depends=(qt5-base)
makedepends=(git extra-cmake-modules-git qt5-xmlpatterns qt5-tools qt5-doc doxygen)
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
    -DQRC_SYNTAX=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
