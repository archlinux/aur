# Maintainer: Tan Si Nan <tansinan_1995@163.com>
# Modified from the PKGBUILD from yaffs2utils-svn

pkgname=yaffs2utils
pkgver=0.2.9
pkgrel=1
pkgdesc="A collection of utilities to make/extract a YAFFS2/YAFFS1 image for Linux."
arch=(i686 x86_64)
url=http://code.google.com/p/yaffs2utils
license=('GPL2')
makedepends=('gcc')
depends=('glibc')
options=('strip')
conflicts=('yaffs2utils-latest' 'yaffs2utils-svn')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgver.tar.gz)
sha512sums=('001a2452515f750bdb2251feebfe20c4f1b716b3c850e13646ee054f8e607c18ecfc2781a2f3e1f288b8b32661b11fec8a87e88d8bd4a44c98cad4dbbffd489b')

build() {
  cd $pkgver
  touch configs.h
  sed -i 's/\($(CC) \)$(LDFLAGS)\(.*\)$/\1\2 $(LDFLAGS)/g' Makefile
  make
}

package() {
  mkdir -p $pkgdir/usr/bin/
  install -m 0755 $srcdir/$pkgver/mkyaffs2 \
                  $srcdir/$pkgver/unyaffs2 $pkgdir/usr/bin/
}
