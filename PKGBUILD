# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=boomaga-qt5
_name=boomaga
pkgver=1.3.0
pkgrel=2
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer - QT5 version"
arch=('i686' 'x86_64')
url="http://www.boomaga.org/"
license=('LGPL')
depends=('qt5-tools' 'poppler')
makedepends=('cmake' 'cups'  'snappy')
conflicts=('boomaga')
source=("https://github.com/Boomaga/boomaga/archive/v$pkgver.tar.gz"
        unknown_format.patch)

prepare() {
 cd $_name-$pkgver
 patch -Np1 -i ../unknown_format.patch
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
sha256sums=('fd05be1100701cf6e7bbbf41b635ca2ca4d1eaf88bfdcf4a83f9a6ba8de24e35'
            '14c118e7aee72b0b375d67e91954c7b772f43aff75c850171b1b244a6e074c7d')
