# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=boomaga-qt5
_name=boomaga
pkgver=0.9.1
pkgrel=3
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer - QT5 version without KDE"
arch=('i686' 'x86_64')
url="http://www.boomaga.org/"
license=('LGPL')
depends=('qt5-tools' 'ghostscript' 'snappy' 'poppler')
makedepends=('cmake')
conflicts=('boomaga')
source=("https://github.com/alium/boomaga/archive/0.9.1-2.tar.gz") # use git master, because some important issue are fixd

#prepare() {
#   cd $_name-$pkgver-2
#   mkdir -p build
#   patch -Np1 -i ../poppler0.58.patch
#}

build() {
 cd $_name-$pkgver-2
  mkdir -p build
  cd build
   cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
   make 
}

package() {
  cd $_name-$pkgver-2
  cd build
    make "DESTDIR=$pkgdir" install
  install -D -m755 $srcdir/$_name-$pkgver-2/scripts/installPrinter.sh ${pkgdir}/usr/bin/
}
sha256sums=('496d249365874e4ed9be65a4c01d19f3249600da741cb462f13f6ff87417b54d')
