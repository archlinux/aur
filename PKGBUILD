# Merged with official ABS kirigami PKGBUILD by João, 2024/03/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: zanny <lordzanny@gmail.com>
# Contributor: Aleix Pol Gonzalez <aleixpol@kde.org>

pkgname=kirigami-git
pkgver=6.0.0_r4407.g7f9b5b4a
pkgrel=1
pkgdesc='A QtQuick based components set'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs glibc qt6-base qt6-declarative qt6-svg)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-shadertools qt6-tools)
groups=(kf6-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
