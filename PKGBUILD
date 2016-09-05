# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=boomaga-qt5
_name=boomaga
pkgver=0.8.0
pkgrel=1
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer - QT5 version without KDE"
arch=('i686' 'x86_64')
url="http://www.boomaga.org/"
license=('LGPL')
depends=('qt5-base' 'ghostscript' 'snappy' 'poppler')
makedepends=('cmake')
conflicts=('boomaga')
source=("https://github.com/boomaga/boomaga/archive/v$pkgver.tar.gz")
md5sums=('9055f2dbd3fa5eb058f6b33784140672')

build() {
   cd $srcdir/${_name}-$pkgver
   cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT5=Yes
   make 
}

package() {
  cd ${srcdir}/${_name}-${pkgver}
    make "DESTDIR=$pkgdir" install
  install -D -m755 $srcdir/$_name-$pkgver/scripts/installPrinter.sh ${pkgdir}/usr/bin/
}
