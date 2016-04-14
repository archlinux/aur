# Contributed by; Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor:  itikhonov
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-doctools-cvs
pkgver=20120529
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Documentation Tools consist of a modern roff suite."
url="http://heirloom.sourceforge.net/doctools.html"
license=('custom:berkeley' 'custom:"caldera"' 'custom:"opensolaris"' 'custom:"lucent"' 'LGPL' 'LPPL')
source=('config.diff')
makedepends=('cvs')
md5sums=('ccb66e215599cab347132e2f3240156e')
sha1sums=('5b7205e61227aceb81599bdb6a2a2c457d79a016')
sha256sums=('c6270ae3abdae91eb9adbdd093b33c9de758b0b31db397d3d406ac6ee16423af')

prepare() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-doctools
  rm -rf $srcdir/build
  cp -ar $srcdir/heirloom-doctools $srcdir/build
  cd "$srcdir/build"
  patch -p1 < ../config.diff
}

build() {
  cd "$srcdir/build"
  make
}

package() {
  cd "$srcdir/build"
  make install ROOT=$pkgdir
  cd "$srcdir/heirloom-doctools/LICENSE"
  for i in *.LICENSE COPYING.LGPL; do
    install -Dm0644 $i $pkgdir/usr/share/licenses/${pkgname%-*}/$i
  done
}

