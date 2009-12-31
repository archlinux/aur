# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=1.0.0
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('kdebase-runtime' 'kdegraphics-libs' 'kdepimlibs' 'lensfun' 'kdeedu-marble' 'liblqr')
makedepends=('pkgconfig' 'cmake' 'automoc4')
source=(http://downloads.sourceforge.net/digikam/${pkgname}-${pkgver}.tar.bz2)
replaces=('digikamimageplugins')
install=digikam.install
optdepends=('kipi-plugins: for more extras and plugins')

build() {
   mkdir build
   cd build
   cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_MARBLEWIDGET=yes -DWITH_MarbleWidget=yes \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed'
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
 }
md5sums=('6169deb68a3d712a0c6539b09c5f8c0c')
