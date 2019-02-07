# Maintainer: ajs124 < aur AT ajs124 DOT de >
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre-static
pkgver=8.42
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=('x86_64')
url="http://www.pcre.org/"
license=('BSD')
depends=('gcc-libs')
options=('staticlibs' '!libtool')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${pkgver}.tar.bz2{,.sig})
sha256sums=('2cd04b7c887808be030254e8d77de11d3fe9d4505c39d4b15d2664ffe8bf9301'
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
