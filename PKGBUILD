# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=1.2.0
pkgrel=2
pkgdesc="Digital photo management application for kde"
arch=('i686' 'x86_64')
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('kdebase-runtime' 'kdegraphics-libs' 'kdepimlibs' 'lensfun' 'kdeedu-marble' 'liblqr')
makedepends=('pkgconfig' 'cmake' 'automoc4')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        digikam-1.2.0-kde232628.patch)
replaces=('digikamimageplugins')
install=digikam.install
optdepends=('kipi-plugins: for more extras and plugins')
md5sums=('8f68022008cf1650924cc8688f176572'
         '2cddb80ade9cd39b1509cb3ff35dd3b0')

build() {
   cd ${srcdir}
   # Fix for FS#18927 - [digikam] crashes in startup 
   patch -Np0 -i ${srcdir}/digikam-1.2.0-kde232628.patch || return 1

   mkdir build
   cd build
   cmake ../${pkgname}-${pkgver} \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DENABLE_MARBLEWIDGET=yes \
     -DWITH_MarbleWidget=yes \
     -DCMAKE_SKIP_RPATH=ON
   make all || return 1
   make DESTDIR="${pkgdir}" install || return 1
 }
