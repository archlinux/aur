# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Marcin Mikołajczak <me@mkljczk.pl>

pkgname=kscreenlocker-git
pkgver=v5.18.90.r21.gf53b9b3
pkgrel=1
pkgdesc='Library and components for secure lock screen architecture'
arch=(i686 x86_64)
url='https://projects.kde.org/kscreenlocker'
license=(LGPL)
depends=(plasma-framework kidletime kwayland libxcursor)
makedepends=(extra-cmake-modules git python kdoctools)
provides=(kscreenlocker)
conflicts=(kscreenlocker)
source=('git+https://anongit.kde.org/kscreenlocker.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kscreenlocker \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
