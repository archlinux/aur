# Contributer: giacomogiorgianni@gmail.com 

pkgname=boomaga
name=Boomaga
pkgver=0.7.1
pkgrel=1
pkgdesc="is a virtual printer for viewing a document before printing it out using the physical printer"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/Boomaga?content=156779&PHPSESSID=6a26cbb183629b8e10911b98dc4a631a"
license=('LGPL')
categories=()
depends=('kdebase-runtime' 'ghostscript' 'snappy' 'poppler>=0.26.5')
makedepends=('cmake' 'gcc')
options=(!emptydirs)
#source=("http://opendesktop.org/CONTENT/content-files/156779-${pkgname}-${pkgver}.tar.bz2")
#source="https://github.com/Boomaga/${pkgname}/archive/v${pkgver}.tar.gz"
source="${pkgname}-${pkgver}.tar.gz::https://github.com/Boomaga/${pkgname}/archive/v${pkgver}.tar.gz" 

md5sums=('725715dcced52e976b743196cee4243c')

build() {
   cd $srcdir/$pkgname-$pkgver
    if [ -d build ] ; then
        rm build/* -rf
    else
        mkdir build
    fi
    cd build
   cmake -DCMAKE_INSTALL_PREFIX=/usr .. 
   make 
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir/" install
  install -D -m755 $srcdir/$pkgname-$pkgver/scripts/installPrinter.sh ${pkgdir}/usr/bin/
   
  #if [ 'pacman -Q poppler | tr -s " "|cut -d" " -f2 | sed 's/..$//'' = '0.28.1' ]; then
  #    ln -s "/usr/lib/libpoppler.so" "${pkgdir}/usr/liblibpoppler.so.46.0.0" || return 1
  #fi 
}
