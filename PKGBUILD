# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=unarchiver
pkgver=2.7.1
pkgrel=2
pkgdesc="An Objective-C application for uncompressing archive files"
arch=('x86_64' 'i686')
url="http://wakaba.c3.cx/s/apps/unarchiver.html"
license=('LGPL2.1')
depends=('gnustep-base' 'openssl' 'bzip2' 'icu' 'gcc-libs' 'zlib')
makedepends=('gcc-objc')
source=("http://theunarchiver.googlecode.com/files/TheUnarchiver${pkgver}_src.zip"
        "native_obj_exceptions.patch"
        "libz.patch")
sha1sums=('dba7a5aee159435a7ad6d1879443ab66a809c970'
          'b8024026607dc2de758479b73d8b01ca6f692b59'
          '003d114a0ba9a919af602881ef5e04cdba2e4c50')

build() {
  cd "$srcdir/The Unarchiver"

  patch -p1 < ../native_obj_exceptions.patch
  patch -p1 < ../libz.patch

  cd XADMaster
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile.linux
}

package() {
  cd "$srcdir/The Unarchiver/XADMaster"
  install -d "$pkgdir/usr/bin/"
  install -m755 unar lsar "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
