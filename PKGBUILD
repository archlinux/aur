# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=boomaga-qt5
_name=boomaga
pkgver=3.0.0
pkgrel=2
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer - QT5 version"
arch=('i686' 'x86_64')
url="http://www.boomaga.org/"
license=('LGPL')
depends=('qt5-tools' 'poppler')
makedepends=('cmake' 'cups'  'snappy')
conflicts=('boomaga')
source=("https://github.com/Boomaga/boomaga/archive/v$pkgver.tar.gz" https://raw.githubusercontent.com/alium/share/master/gs954.patch)

prepare() {
 cd $_name-$pkgver
 patch -Np1 -i ../gs954.patch
}



build() {
 cd $_name-$pkgver
 cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
   make 
}

package() {
  cd $_name-$pkgver
    make "DESTDIR=$pkgdir" install
  install -D -m755 $srcdir/$_name-$pkgver/scripts/installPrinter.sh ${pkgdir}/usr/bin/
}
sha256sums=('74af10ec5a78008d335011eca0f63ed7ccd4bc2fdac2f4cffa73db7acc05e767'
            'cd8ae3cf1e4b34eb03a53697db543caf90c5b0f39526304c90438d955ff460d2')
