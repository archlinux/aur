# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=lwan-git
pkgver=c048585
pkgrel=1
pkgdesc="Experimental, scalable, high performance HTTP server"
arch=('any')
url="https://lwan.ws/"
license=(GPL)
depends=('jemalloc' 'luajit' 'libmariadbclient')
makedepends=('cmake')
provides=('lwan')
source=('git+https://github.com/lpereira/lwan/')
sha1sums=('SKIP')
_gitname=lwan

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  install -Dm755 ${srcdir}/${_gitname}/build/lwan/lwan ${pkgdir}/usr/bin/lwan
}

# vim:set ts=2 sw=2 et:
