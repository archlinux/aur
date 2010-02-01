# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=1.1.0
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=('i686' 'x86_64')
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('kdebase-runtime' 'kdegraphics-libs' 'kdepimlibs' 'lensfun' 'kdeedu-marble' 'liblqr')
makedepends=('pkgconfig' 'cmake' 'automoc4')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        libpng14.patch)
replaces=('digikamimageplugins')
install=digikam.install
optdepends=('kipi-plugins: for more extras and plugins')

build() {
   cd ${srcdir}
   patch -Np0 -i ${srcdir}/libpng14.patch || return 1

   mkdir build
   cd build
   cmake ../${pkgname}-${pkgver} \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DENABLE_MARBLEWIDGET=yes \
     -DWITH_MarbleWidget=yes \
     -DCMAKE_SKIP_RPATH=ON
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
 }
md5sums=('94a536e7387325c7b73ab2ac7b0a9a62'
         'a9efe4671abc89ce46881c843b3a88b6')
