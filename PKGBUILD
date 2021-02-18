# Merged with official ABS libkscreen PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Matthias Blaicher <matthias at blaicher dot com>

pkgname=libkscreen-git
pkgver=5.21.80_r1565.gbb3395f
pkgrel=1
pkgdesc='KDE screen management software'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(qt5-x11extras libxrandr kwayland-git)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools qt5-doc)
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
