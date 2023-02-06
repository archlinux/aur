# Merged with official ABS syndication PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=syndication-git
pkgver=5.240.0_r901.gd69d294
pkgrel=1
pkgdesc="RSS/Atom parser library"
arch=($CARCH)
url="https://community.kde.org/Frameworks"
license=(LGPL)
depends=(kcodecs-git)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools qt5-doc)
conflicts=(${pkgname%-git} kde-syndication kde-syndication-git)
provides=(${pkgname%-git} kde-syndication kde-syndication-git)
groups=(kf5-git)
replaces=(kde-syndication-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF5\?_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
