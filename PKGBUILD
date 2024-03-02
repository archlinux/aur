# Merged with official ABS ktexttemplate PKGBUILD by João, 2024/03/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=ktexttemplate-git
pkgver=6.0.0_r1627.g151a10a
pkgrel=1
pkgdesc='Library to allow application developers to separate the structure of documents from the data they contain'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.1-or-later)
depends=(gcc-libs glibc qt6-base qt6-declarative)
makedepends=(git doxygen extra-cmake-modules-git qt6-doc qt6-tools)
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
