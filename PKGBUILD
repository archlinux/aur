# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares-cmake
_pkgname=c-ares
pkgver=1.15.0
pkgrel=1
pkgdesc='C library that performs DNS requests and name resolves asynchronously (with cmake build files)'
arch=('x86_64')
url='https://c-ares.haxx.se/'
license=('custom')
depends=('glibc')
makedepends=('cmake')
source=("https://c-ares.haxx.se/download/$_pkgname-$pkgver.tar.gz"
        'LICENSE')
sha512sums=('a1de6c5e7e1a6a13c926aae690e83d5caa51e7313d63da1cf2af6bc757c41d585aad5466bc3ba7b7f7793cb1748fa589f40972b196728851c8b059cfc8c3be50'
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
