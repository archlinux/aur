# Maintainer: Sam Stuewe <halosghost@archlinux.info>

pkgname=liblwan-git
pkgver=r1467.b1515c2
pkgrel=1
pkgdesc="Experimental, scalable, high performance HTTP server library"
arch=('i686' 'x86_64')
url="https://lwan.ws/"
license=(GPL)
depends=('jemalloc' 'luajit' 'libmariadbclient')
makedepends=('cmake')
provides=('liblwan')
source=('git+https://github.com/lpereira/lwan/')
sha1sums=('SKIP')
_gitname=lwan

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' ../
  make
}

package() {
  cd $_gitname/build
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib/liblwan.a
}

# vim:set ts=2 sw=2 et:
