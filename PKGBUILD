# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=1.0.0beta3
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=(i686 x86_64)
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('kdebase-runtime' 'kdegraphics-libs' 'kdepimlibs' 'lensfun' 'kdeedu-marble' 'liblqr')
makedepends=('pkgconfig' 'cmake' 'automoc4')
source=(http://downloads.sourceforge.net/digikam/${pkgname}-1.0.0-beta3.tar.bz2)
replaces=('digikamimageplugins')
install=digikam.install
optdepends=('kipi-plugins: for more extras and plugins')

build() {
  cd ${srcdir}/${pkgname}-1.0.0-beta3
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_MARBLEWIDGET=yes -DWITH_MarbleWidget=yes \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed'
   make all|| return 1
   make DESTDIR=${pkgdir} install || return 1
 }
md5sums=('937f6f1f109e8137dad8f1b59f009891')
