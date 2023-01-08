# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvdnav-git
pkgver=6.1.1.23.g9831fe0
pkgrel=1
pkgdesc="Library to navigate DVD disks. (GIT version)"
arch=('x86_64')
license=('GPL2')
url='https://dvdnav.mplayerhq.hu'
depends=('libdvdread.so')
makedepends=('git'
             'libdvdread'
             )
provides=('libdvdnav'
          'libdvdnav.so'
          )
conflicts=('libdvdnav')
source=('git+https://code.videolan.org/videolan/libdvdnav.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvdnav
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd libdvdnav
  autoreconf -vif

  cd "${srcdir}/build"
  ../libdvdnav/configure \
    --prefix=/usr \
    --enable-static=no

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
