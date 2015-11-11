# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=boomaga-qt5
_name=boomaga
pkgver=0.7.1
pkgrel=1
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer - no KDE version"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/Boomaga?content=156779&PHPSESSID=6a26cbb183629b8e10911b98dc4a631a"
license=('LGPL')
depends=('qt5-base' 'ghostscript' 'snappy' 'poppler>=0.26.5')
makedepends=('cmake' 'gcc')
options=(!emptydirs)
source="${_name}-${pkgver}.tar.gz::https://github.com/Boomaga/${_name}/archive/v${pkgver}.tar.gz" 

md5sums=('ff29951837c789fe521221938b474ad2')

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
md5sums=('725715dcced52e976b743196cee4243c')
