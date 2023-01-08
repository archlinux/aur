# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvdread-git
pkgver=6.1.3.9.gba2227b
pkgrel=1
pkgdesc="Library to access DVD disks. (GIT version)"
arch=('x86_64')
license=('GPL2')
url='https://dvdnav.mplayerhq.hu'
depends=('libdvdcss.so')
makedepends=('git'
             'libdvdcss'
             )
provides=('libdvdread'
          'libdvdread.so'
          )
conflicts=('libdvdread')
source=('git+https://code.videolan.org/videolan/libdvdread.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvdread
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd libdvdread
  autoreconf -vif

  cd "${srcdir}/build"
  ../libdvdread/configure \
    --prefix=/usr \
    --enable-static=no \
    --with-libdvdcss

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
