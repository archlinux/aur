# Merged with official ABS kdav PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=kdav-git
pkgver=5.79.0_r1261.g7e75073
pkgrel=1
epoch=1
pkgdesc="A DAV protocol implemention with KJobs"
arch=($CARCH)
url="https://community.kde.org/Frameworks"
license=(LGPL)
depends=(kio-git qt5-xmlpatterns)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools)
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
