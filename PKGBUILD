# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=redispp-git
pkgver=r38.c55b002
pkgrel=1
pkgdesc='C++ client for Redis'
arch=(i686 x86_64)
url='https://github.com/brianwatling/redispp'
license=('Public domain')
makedepends=(git boost)
source=(git://github.com/brianwatling/redispp)
sha1sums=('SKIP')

pkgver() {
  cd redispp
  # repo does not have any git tags yet
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd redispp
  unset CXXFLAGS
  EXTRA_CXXFLAGS="$CFLAGS" make libredispp.so
}

check() {
  cd redispp
# the tests require server
# ./unittests && ./perftest && ./multitest && ./transtest
}

package() {
  cd redispp
  mkdir -p "$pkgdir"/usr/{lib,include}
  install libredispp.so "$pkgdir/usr/lib"
  install -m644 src/redispp.h "$pkgdir/usr/include"
}
