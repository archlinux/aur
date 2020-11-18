# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clsync
pkgver=0.4.5
pkgrel=1
pkgdesc="File live sync daemon based on inotify/kqueue/bsm (Linux, FreeBSD), written in GNU C"
arch=('x86_64')
url='http://ut.mephi.ru/oss/clsync'
license=('GPL3')
depends=('libcgroup'
         'glib2')
makedepends=('doxygen'
             'graphviz'
             'libcap'
             'libcgroup'
             'mhash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/clsync/clsync/archive/v${pkgver}.tar.gz")
sha256sums=('dcf6e45914edac00c660942594f0c8958c6c7b9819c11277b7d9eb596f52cb81')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr \
              --with-libcgroup=yes \
              --with-inotify=yes \
              --with-mhash=yes 
  make -j$(nproc)
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
