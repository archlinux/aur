# $Id: PKGBUILD 232066 2015-02-27 12:29:32Z heftig $
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint-vfs0050
pkgver=0.6.0
pkgrel=1
pkgdesc="Library for fingerprint readers with vfs0050 driver(github.com/zemen/libfprint)"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libusb nss pixman)
groups=(fprint)
options=(!emptydirs)
source=(http://people.freedesktop.org/~hadess/libfprint-$pkgver.tar.xz vfs0050.patch)
md5sums=('1e66f6e786348b46075368cc682450a8'
         '4d6e6d825aac69cc337885b82415a5c7')

prepare() {
  cd libfprint-$pkgver
  patch -Np1 -i $srcdir/vfs0050.patch
  aclocal
}

build() {
  cd libfprint-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  automake
  make
}

package() {
  cd libfprint-$pkgver
  make DESTDIR="$pkgdir" install
}
