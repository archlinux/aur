# $Id$
# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ctags_as3_haxe
pkgver=5.8
pkgrel=2
pkgdesc="Generates an index file of language objects found in source files, with patch for as3 and haxe"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
provides=('ctags')
conflicts=('ctags')
url="http://www.dafishinsea.com/blog/2010/01/21/getting-ctags-to-work-with-actionscript-and-haxe/"
source=("http://downloads.sourceforge.net/sourceforge/${pkgname%%_*}/${pkgname%%_*}-${pkgver}.tar.gz"
        'http://www.dafishinsea.com/downloads/ctags_as3_haxe_patched_files.tar.gz')
md5sums=('c00f82ecdcc357434731913e5b48630d'
         'faa6108de15b2bae2feac521b5e5b7f7')

build() {
  cd ${srcdir}/${pkgname%%_*}-${pkgver}
  install -m644 $srcdir/ctags_as3_haxe_patched_files/* .
  ./configure --prefix=/usr \
              --disable-external-sort
  make
}

package() {
  cd ${srcdir}/${pkgname%%_*}-${pkgver}
  make prefix=${pkgdir}/usr install
}
