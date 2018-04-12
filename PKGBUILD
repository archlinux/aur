# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvdread-git
pkgver=6.0.0.0.g95fdbe8
pkgrel=1
pkgdesc="Library to access DVD disks. (GIT version)"
arch=('x86_64')
url='http://dvdnav.mplayerhq.hu'
license=('GPL2')
depends=('glibc'
         'libdvdcss-git'
         )
makedepends=('git')
provides=('libdvdread' 'libdvdread.so')
conflicts=('libdvdread')
source=('git+https://code.videolan.org/videolan/libdvdread.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvdread
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libdvdread
  autoreconf -if
}

build() {
  cd libdvdread
  ./configure \
    --prefix=/usr \
    --enable-static=no \
    --with-libdvdcss

  make
}

package() {
  make -C libdvdread DESTDIR="${pkgdir}" install
}
