# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkg=p7zip
_ver=9.20.1
pkgname=lib7zip
pkgver=1.6.5
pkgrel=1
pkgdesc="A library using 7z.dll/7z.so(from 7-Zip) to handle different archive types."
arch=(i686 x86_64)
url="http://code.google.com/p/lib7zip/"
license=('MPL')
makedepends=('libtool')
options=('!libtool')
source=("http://lib7zip.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        "http://downloads.sourceforge.net/project/${_pkg}/${_pkg}/${_ver}/${_pkg}_${_ver}_src_all.tar.bz2")
md5sums=('a127ec183797dcf685938372dc5bf72a'
         'bd6caaea567dc0d995c990c5cc883c89')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # point to p7zip source
  export P7ZIP_SOURCE_DIR="$srcdir/${_pkg}_${_ver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # header
  install -Dm644 Lib7Zip/$pkgname.h \
     "$pkgdir/usr/include/$pkgname.h"
}
