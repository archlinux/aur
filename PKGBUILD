# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=soapdenovo-trans
pkgver=1.04
pkgrel=1
pkgdesc="de novo transcriptome assembler"
arch=('i686' 'x86_64')
url="http://soap.genomics.org.cn/SOAPdenovo-Trans.html"
license=('GPL3')
depends=('zlib')
source=("$pkgname-$pkgver.zip::http://downloads.sourceforge.net/project/soapdenovotrans/SOAPdenovo-Trans/src/v$pkgver/SOAPdenovo-Trans-src-v$pkgver.zip")
md5sums=('be5fc908051bffd95a9499a497ccd3fa')

prepare() {
  cd $srcdir/SOAPdenovo-Trans-src-v$pkgver/src

  sed -e 's|-static||' \
      -e 's|clean SOAPdenovo|SOAPdenovo|' \
      -i Makefile
}

build() {
  cd $srcdir/SOAPdenovo-Trans-src-v$pkgver/src

  make
  rm -f *.o
  make 63mer=1 SOAPdenovo
  rm -f *.o
  make 127mer=1 SOAPdenovo
}

package() {
  cd $srcdir/SOAPdenovo-Trans-src-v$pkgver

  for i in SOAPdenovo-Trans-127mer SOAPdenovo-Trans-63mer SOAPdenovo-Trans-31mer ; do
    install -Dm755 $i $pkgdir/usr/bin/$i
  done
}
