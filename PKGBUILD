# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libcloudstorage
pkgver=1.2
pkgrel=1
pkgdesc="C++ library providing access to files located in various cloud services"
arch=('i686' 'x86_64')
url="https://code.videolan.org/videolan/libcloudstorage"
license=('LGPL')
depends=('crypto++' 'curl' 'fuse3' 'jsoncpp' 'libmicrohttpd' 'mega-sdk' 'tinyxml2')
source=("https://code.videolan.org/videolan/libcloudstorage/-/archive/$pkgver/libcloudstorage-$pkgver.tar.bz2"
        "0001-Fix-compilation-with-newer-crypto.patch")
sha256sums=('2ce657cb03ad46cc97b11db1acf13ee1abe0b22869eb602358b34743617d3a4e'
            'a12406b7e429fa6fa7ed60f85a4a7bb936664890886003b3a86f462b007af373')


prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-Fix-compilation-with-newer-crypto.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
