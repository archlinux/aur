# Contributor: Alexander Baldeck <alexander.baldeck@icomedias.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xli
pkgver=1.17.0+20061110
pkgrel=7
pkgdesc="An image display program for X"
depends=('libxext' 'libpng' 'libjpeg')
makedepends=('patch')
arch=('i686' 'x86_64')
license=('custom')
url="ftp://ftp.de.debian.org/debian/pool/main/x/xli/"
source=(ftp://ftp2.de.debian.org/debian/pool/main/x/xli/${pkgname}_${pkgver}.orig.tar.gz \
        ftp://ftp2.de.debian.org/debian/pool/main/x/xli/xli_$pkgver-4.diff.gz c_includes.diff  makefile.patch)
md5sums=('2cdef0c420f54f0cf668f751fd581706'
         'fc1985c39e6c8ae7bacce5aa1d9cb190'
         '4d0db38476f7fd80ae66fb7cd431e0bd'
         'b366cc06ed57bb04e3f4293dccb70aff')

prepare() {
  cd $srcdir/xli-2006-11-10
  patch -Np1 -i $srcdir/xli_1.17.0+20061110-4.diff
  patch -Np1 -i $srcdir/c_includes.diff
  patch -Np1 -i $srcdir/makefile.patch
}

build() {
  cd $srcdir/xli-2006-11-10
  [[ -d build ]] && mkdir $srcdir/build
  CFLAGS+="-DHAVE_GUNZIP" make -f Makefile.std xli xlito
}

package() {
  cd $srcdir/xli-2006-11-10
  install -Dm755 xli $pkgdir/usr/bin/xli
  install -Dm755 xlito $pkgdir/usr/bin/xlito
  pushd $pkgdir/usr/bin
  ln -s xli xview 
  ln -s xli xsetbg
  popd
  install -d $pkgdir/usr/share/man/man1/
  install -m644 xli.man $pkgdir/usr/share/man/man1/xli.1
  install -m644 xliguide.man $pkgdir/usr/share/man/man1/xliguide.1
  install -m644 xlito.man $pkgdir/usr/share/man/man1/xlito.1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 copyright.h $pkgdir/usr/share/licenses/$pkgname/
  install -m644 kljcpyrght.h $pkgdir/usr/share/licenses/$pkgname/
  install -m644 mit.cpyrght $pkgdir/usr/share/licenses/$pkgname/ 
  install -m644 mrmcpyrght.h $pkgdir/usr/share/licenses/$pkgname/ 
}
