# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=boomaga-qt5
_name=boomaga
pkgver=0.9.1
pkgrel=2
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer - QT5 version without KDE"
arch=('i686' 'x86_64')
url="http://www.boomaga.org/"
license=('LGPL')
depends=('qt5-tools' 'ghostscript' 'snappy' 'poppler>=0.58')
makedepends=('cmake')
conflicts=('boomaga')
source=("https://github.com/boomaga/boomaga/archive/v$pkgver.tar.gz"
poppler0.58.patch)

prepare() {
   cd $_name-$pkgver
   patch -Np1 -i ../poppler0.58.patch
}


build() {
   cd $_name-$pkgver
   cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT5=Yes
   make 
}

package() {
  cd $_name-$pkgver
    make "DESTDIR=$pkgdir" install
  install -D -m755 $srcdir/$_name-$pkgver/scripts/installPrinter.sh ${pkgdir}/usr/bin/
}
sha256sums=('e09548f5938d391ee85d044aec8871b93ff9c912b05932af3c2a1efaf83473ea'
            '5fe507db5151358f8da74fecc73bdbb2638a734a9b168de7f7cc5a9152d00098')
