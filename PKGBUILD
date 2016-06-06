# Maintainer: orumin <dev@orum.in>

_basename=libtiger
pkgname="lib32-$_basename"
pkgver=0.3.4
pkgrel=1
pkgdesc="A rendering library for Kate streams using Pango and Cairo (32-bit)"
url="http://libtiger.googlecode.com/"
license=('LGPL')
arch=('x86_64')
depends=('lib32-pango' 'lib32-libkate')
makedepends=('pkg-config')
source=("http://libtiger.googlecode.com/files/${_basename}-${pkgver}.tar.gz")
md5sums=("dc1dbeb658c95485ba10b9b2897b4ae2")

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --build=i686-pc-linux-gnu \
              --enable-static=no \
              --disable-doc

  make
}

package() {
  cd $_basename-$pkgver

  make DESTDIR="${pkgdir}" install

  cd "$pkgdir"/usr
  rm -r include
}
