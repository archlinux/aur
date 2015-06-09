# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Original-Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libndp
_pkgname=libndp
pkgver=1.4
pkgrel=1
pkgdesc="Library for Neighbor Discovery Protocol"
arch=(i686 x86_64)
url="http://libndp.org/"
license=(LGPL2.1)
depends=(glibc)
source=($url/files/$_pkgname-$pkgver.tar.gz)
sha256sums=('3a0be247ec024bd72fe5b40ea9491519c4023c7faf078311196fab817b2fd55f')

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
