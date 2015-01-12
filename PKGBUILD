# Maintainer: oi_wtf <brainpower at gulli dot com>
# Original-Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libndp
_pkgname=libndp
pkgver=1.3
pkgrel=1
pkgdesc="Library for Neighbor Discovery Protocol"
arch=(x86_64)
url="http://libndp.org/"
license=(LGPL2.1)
depends=(glibc)
source=($url/files/$_pkgname-$pkgver.tar.gz)
sha256sums=('58a013427debfc554f1ff6555bccfd3ba910d50effc8231cfcad79f0f19c3f9e')

build() {
  cd $_pkgname-$pkgver
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --libexecdir=/usr/lib --libdir=/usr/lib32
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # lib32 cleanup
  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc"
}
