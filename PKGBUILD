# Merged with official ABS ktexteditor PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=ktexteditor-git
pkgver=5.240.0_r3753.g46b6c3c6
pkgrel=1
pkgdesc='Advanced embeddable text editor'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kparts-git syntax-highlighting-git libgit2 editorconfig-core-c)
makedepends=(git extra-cmake-modules-git doxygen qt6-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
