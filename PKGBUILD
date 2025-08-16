# Maintainer: Fabian Brosda <fabi3141@gmx.de>
#
# The patches are taken from the debian repository of karme
# http://karme.de/debian/pool/main/g/gauche-fastcgi/

pkgname=gauche-fastcgi
_pkgname=Gauche-fastcgi
pkgver=0.2.0
pkgrel=1
pkgdesc='Gauche module for fastcgi'
url='https://github.com/fbrosda/Gauche-fastcgi'
arch=('i686' 'x86_64')
depends=('gauche' 'fcgi')
makedepends=('make' 'autoconf')
license=('BSD')

# include any patches you want to have applied here
source=('https://github.com/fbrosda/Gauche-fastcgi/archive/refs/tags/0.2.0.tar.gz')
sha1sums=('bc71c82751cc143364096ec9661e91b79491050a')

build() {
  export LDFLAGS=""
  cd "${_pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
