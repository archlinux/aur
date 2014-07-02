# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=lib32-smpeg2
pkgver=2.0.0
pkgrel=1
pkgdesc="SDL2 MPEG Player Library (32 bit)"
arch=('x86_64')
url="http://icculus.org/smpeg/"
license=('LGPL')
depends=("${pkgname#*-}=1:$pkgver" 'bash' 'lib32-sdl2' 'lib32-gcc-libs')
makedepends=('svn')
source=($pkgname-$pkgver::"svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
md5sums=('SKIP')

build() {
  cd $pkgname-$pkgver

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir"/usr/{bin/plaympeg,share,include}
  mv "$pkgdir"/usr/bin/smpeg2-config{,-32}
}
