# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares-cmake
_pkgname=c-ares
pkgver=1.16.1
pkgrel=1
pkgdesc='C library that performs DNS requests and name resolves asynchronously (with cmake build files)'
arch=('x86_64')
url='https://c-ares.haxx.se/'
license=('custom')
depends=('glibc')
makedepends=('cmake')
source=("https://c-ares.haxx.se/download/$_pkgname-$pkgver.tar.gz"
        'LICENSE')
sha512sums=('4ac2a5d5c6da74eb1d6155c4eadc7127ab1b53a8d13caec41bd6172db5417a79f3ab022e77ba37d8b13da6893d7ced5fd8baf5cc3950a4154b4de8743ad31471'
            '55e8607392c5f82ed85e3580fa632dfdc2dcd0b1a5e918dc61d00532c15c11ecb709f6007b65805c1fbe8fcd21ee794c9e4a9638c97ac1f4960b2654010a4d0a')
provides=('c-ares')
conflicts=('c-ares')

build() {
  cd "$_pkgname-$pkgver"

  mkdir -p build; cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        ..
  make
}

package() {
  cd "$_pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
