# $Id: PKGBUILD 192469 2016-10-17 19:29:41Z arojas $
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=injeqt
pkgver=1.1.0
pkgrel=1
pkgdesc='Dependency injection framework for Qt'
arch=('i686' 'x86_64')
url='https://github.com/vogel/injeqt'
license=('LGPL2.1')
depends=('qt5-base')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        gcc7-fix.patch)
md5sums=('9a582037c454b1355e808bb2e07126bb'
         '19e2666e706984b3b774c11c4379e7fe')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../gcc7-fix.patch
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DDISABLE_EXAMPLES=ON \
    -DDISABLE_TESTS=ON
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

