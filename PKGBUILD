# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=1.0.0rc
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('kdebase-runtime' 'kdegraphics-libs' 'kdepimlibs' 'lensfun' 'kdeedu-marble' 'liblqr')
makedepends=('pkgconfig' 'cmake' 'automoc4')
source=(http://downloads.sourceforge.net/digikam/${pkgname}-1.0.0-rc.tar.bz2)
replaces=('digikamimageplugins')
install=digikam.install
optdepends=('kipi-plugins: for more extras and plugins')

build() {
   mkdir build
   cd build
   cmake ../${pkgname}-1.0.0-rc -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_MARBLEWIDGET=yes -DWITH_MarbleWidget=yes \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed'
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
 }
md5sums=('270c268c6fb6880520b290d5ed5ca020')
