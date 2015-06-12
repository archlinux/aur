# $Id: PKGBUILD 197154 2013-10-23 13:04:19Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre-static
pkgver=8.36
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=('i686' 'x86_64')
url="http://www.pcre.org/"
license=('BSD')
depends=('gcc-libs')
options=('staticlibs' '!libtool')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${pkgver}.tar.bz2{,.sig})
md5sums=('b767bc9af0c20bc9c1fe403b0d41ad97'
         'SKIP')

build() {
  cd "${srcdir}"/pcre-${pkgver}
  ./configure --prefix=/usr \
    --enable-pcre16 --enable-pcre32 --enable-jit \
    --enable-utf --enable-unicode-properties
  make
}

package() {
  cd "${srcdir}"/pcre-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf $pkgdir/usr/{bin,include,share,lib/pkgconfig}
  rm -f $pkgdir/usr/lib/*.so*

  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
