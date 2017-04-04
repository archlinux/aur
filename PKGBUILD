# Maintainer: Sam Stuewe <halosghost@archlinux.info>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=lwan-git
pkgver=r1698.ecb28b6
pkgrel=2
pkgdesc='Experimental, scalable, high performance HTTP server'
arch=('i686' 'x86_64')
url='https://lwan.ws/'
license=(GPL)
depends=('jemalloc' 'luajit' 'libmariadbclient')
makedepends=('cmake')
provides=('lwan')
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
  mv "$pkgdir"/usr/lib64/liblwan.so "$pkgdir"/usr/lib/liblwan.so
  rm -rf "$pkgdir"/usr/lib64
}

# vim:set ts=2 sw=2 et:
