# Maintainer: ToadKing <toadking at toadking dot com>
# Contributor: Peter Lamby <peterlamby@web.de>
pkgname=deadbeef-mpris2-plugin-git
pkgver=r168.4da29ba
pkgrel=1
pkgdesc="MPRISv2 plugin for the DeaDBeeF music player (dev branch)"
arch=('i686' 'x86_64')
url="https://github.com/DeaDBeeF-Player/deadbeef-mpris2-plugin"
license=('GPL2')
depends=('glib2' 'deadbeef')
makedepends=('git')
conflicts=('deadbeef-mpris2-plugin')
options=('!libtool')
source=('git+https://github.com/DeaDBeeF-Player/deadbeef-mpris2-plugin.git')
md5sums=('SKIP')

build() {
  cd "${srcdir}/deadbeef-mpris2-plugin"
  autoreconf --install
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/deadbeef-mpris2-plugin"
  make DESTDIR="${pkgdir}" install
}

pkgver() {
  cd "$srcdir/deadbeef-mpris2-plugin"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}
