# Merged with official ABS kdegraphics-mobipocket PKGBUILD by João, 2021/03/05 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdegraphics-mobipocket-git
pkgver=24.02.0_r291.g3176868
pkgrel=1
pkgdesc="A collection of plugins to handle mobipocket files"
url="https://www.kde.org/applications/graphics/"
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc qt6-5compat qt6-base)
makedepends=(git extra-cmake-modules-git)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-graphics-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
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
