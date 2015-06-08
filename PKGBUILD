# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvdnav-git
pkgver=5.0.2.4.g5fb9197
pkgrel=1
pkgdesc="Library to navigate DVD disks. (GIT version)"
arch=('i686' 'x86_64')
url="http://dvdnav.mplayerhq.hu"
license=('GPL2')
depends=('libdvdread-git')
makedepends=('git')
provides=('libdvdnav')
conflicts=('libdvdnav')
source=("git://git.videolan.org/libdvdnav.git")
sha1sums=('SKIP')

pkgver() {
  cd libdvdnav
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libdvdnav
  autoreconf -if
}

build() {
  cd libdvdnav
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  make -C libdvdnav DESTDIR="${pkgdir}" install
}
