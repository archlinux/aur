# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libfiber-git
pkgver=r212.198c70e
pkgrel=1
pkgdesc='A User Space Threading Library Supporting Multi-Core Systems'
arch=(i686 x86_64)
url='https://github.com/brianwatling/libfiber'
license=(Not specified)
makedepends=(git cmake)
source=(git://github.com/brianwatling/libfiber)
sha1sums=('SKIP')

pkgver() {
  cd libfiber
  # repo does not have any git tags yet
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd libfiber
  sed -e 's/ time / /g' -i Makefile
}

build() {
  cd libfiber
  make libfiber.so
}

check() {
  cd libfiber
  make runtests
}

package() {
  cd libfiber
  mkdir -p "$pkgdir/usr/lib"
  install libfiber.so "$pkgdir/usr/lib"
}
