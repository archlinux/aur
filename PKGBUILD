# Merged with official ABS libqaccessibilityclient PKGBUILD by João, 2024/03/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=libqaccessibilityclient-qt6-git
pkgver=0.6.0_r386.g78a0fb5
pkgrel=1
arch=($CARCH)
pkgdesc='Helper library to make writing accessibility tools easier'
url='https://www.kde.org'
license=(LGPL2.1)
depends=(gcc-libs glibc qt6-base)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%%-*}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%%-*}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%%-*} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
