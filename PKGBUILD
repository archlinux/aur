# Upstream Maintainer: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: 
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=cracklib
pkgname=libx32-$_pkgbasename
pkgver=2.8.19
pkgrel=1.1
pkgdesc="Password Checking Library (x32 ABI)"
arch=('x86_64')
url="http://sourceforge.net/projects/cracklib"
license=('LGPL')
depends=('libx32-glibc' 'libx32-zlib' "$_pkgbasename")
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('ca0ec168d9c6466612204e8dfb2df8a9')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/libx32 --without-python CC='gcc -mx32'
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/usr"/{include,sbin,share}
}
