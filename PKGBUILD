# Maintainer : Esclapion <esclapion at gmail.com>

pkgname=qastools-qt5
_pkgname=qastools
pkgver=0.21
pkgrel=1
pkgdesc="A collection of desktop applications for the Linux sound system ALSA."
arch=(i686 x86_64)
url="http://xwmw.org/qastools/"
license=('GPL3')
depends=('qt5-base' 'alsa-lib' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
provides=('qasconfig' 'qashctl' 'qasmixer')
conflicts=('qastools' 'qasmixer' 'qashctl' 'qasconfig')
source=(http://esclapion.free.fr/AUR/${_pkgname}-${pkgver}.tar.gz)
md5sums=('f39c39666ba2928006fd7c7ab76dd4e6')

package() {
  cd $srcdir/${_pkgname}
  mkdir -p build
  cd build
  cmake .. -DUSE_QT5=ON -DCMAKE_INSTALL_PREFIX=/usr
  nbthreads=$(cat /proc/cpuinfo | grep processor | wc -l)
  make -j$nbthreads DESTDIR="$pkgdir/" install
}
