# Maintainer: Athaudia <athaudia at gmail dot com>

set -u
pkgname='nopoll-git'
pkgver='r287.b18aef3'
pkgrel='1'
pkgdesc='Websocket library written in C'
arch=('i686' 'x86_64')
url='http://www.aspl.es/nopoll/'
license=('LGPL')
depends=('openssl')
provides=('nopoll')
conflicts=('nopoll')
source=("git+https://github.com/ASPLes/nopoll.git")
sha1sums=('SKIP')

pkgver() {
  cd nopoll
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  set -u
  cd nopoll
  sed -i 's/^AM_INIT_AUTOMAKE$/AM_INIT_AUTOMAKE\(\[foreign\]\)/' configure.ac
  autoreconf -i
  ./configure --prefix='/usr' --enable-maintainer-mode
  set +u
}

build() {
  set -u
  cd nopoll
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd nopoll
  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u
