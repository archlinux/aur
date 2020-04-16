# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Matthias Blaicher <matthias at blaicher dot com>

pkgname=libkscreen-kwinft-git
pkgver=r1525.fe0bad4
pkgrel=1
pkgdesc='KDE screen management software, fork with support for KWinFT through wrapland'
arch=(i686 x86_64)
url='https://gitlab.com/kwinft/libkscreen'
license=(LGPL)
depends=(qt5-x11extras libxrandr wrapland)
makedepends=(extra-cmake-modules git)
provides=(libkscreen)
conflicts=(libkscreen)
source=('git+https://gitlab.com/kwinft/libkscreen.git')
md5sums=('SKIP')

pkgver() {
  cd libkscreen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkscreen \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
