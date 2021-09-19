# Merged with official ABS libkscreen PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>

pkgname=libkscreen-git
pkgver=5.23.80_r1594.g29eee17
pkgrel=1
pkgdesc='KDE screen management software'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(qt5-x11extras libxrandr kwayland-git)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools plasma-wayland-protocols-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
