# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libbluray
pkgname=lib32-${_pkgbase}
pkgver=0.7.0
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback (32bit)"
arch=('x86_64')
url="http://www.videolan.org/developers/libbluray.html"
license=('LGPL2.1')
depends=('lib32-libxml2' 'lib32-fontconfig')
makedepends=('gcc-multilib')
options=(!libtool)
source=(ftp://ftp.videolan.org/pub/videolan/$_pkgbase/$pkgver/$_pkgbase-$pkgver.tar.bz2)
sha512sums=('2bf73398003e5a6b12ffdf44ec5716c18da4a176328b4eac52adb3337d09fcb4e5b553362cb67d70506fb0b2cd60e2e59ccc398104630554f41f0b095fc4703f')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cd $_pkgbase-$pkgver
  
  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-doxygen-doc
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim:set ts=2 sw=2 et:
