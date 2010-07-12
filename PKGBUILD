# $Id$
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>

pkgname=magickthumbnail
pkgver=0.5.2
pkgrel=1
pkgdesc="Helper program for ROX-Filer that provides thumbnails for image and font files"
arch=('i686' 'x86_64')
url="http://roxos.sunsite.dk/dev-contrib/guido/"
license=("GPL2")
depends=('rox' 'rox-lib')
install=magickthumbnail.install
source=(http://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/MagickThumbnail-${pkgver}.tar.bz2
	magickthumb.py_PDF-FirstPage.patch
	Python-Replace-MD5-Hashlib.patch)

build() {
  mkdir -p $startdir/pkg/usr/share
  cd ${srcdir}/MagickThumbnail
  patch -p1 < ${srcdir}/magickthumb.py_PDF-FirstPage.patch
  patch -p1 < ${srcdir}/Python-Replace-MD5-Hashlib.patch
  cp -rp ${srcdir}/MagickThumbnail $startdir/pkg/usr/share
   # create a shellscript which is known in the PATH
  mkdir -p $startdir/pkg/usr/bin
  echo "#!/bin/sh" > "$startdir/pkg/usr/bin/magickthumbnail"
  echo "exec /usr/share/MagickThumbnail/AppRun \"\$@\"" >> "$startdir/pkg/usr/bin/magickthumbnail"
  chmod a+x $startdir/pkg/usr/bin/magickthumbnail
}
md5sums=('6cd87e393c860a6ce8e6f16164221815'
         'f6101f1f5fc0420d3ed00683e4863c91'
         'e17bc8ed4420de7ddfb779f044f4f30f')
