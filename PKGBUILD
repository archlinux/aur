# Author : Petr Vanek <petr at yarpen.cz>

# Maintainer : Esclapion <esclapion at gmail.com>

pkgname=qlipper-qt5-git
_pkgname=qlipper
pkgver=r65.44eb028
pkgrel=2
pkgdesc="Clipboard applet based on qt5"
arch=(i686 x86_64)
url="https://github.com/pvanek/qlipper"
license=('GPLv2+')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools')
provides=('qlipper')
conflicts=('qlipper')
source=(git+https://github.com/pvanek/qlipper)
md5sums=('SKIP')

pkgver() {
        cd ${srcdir}/${_pkgname}
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${_pkgname}
  mkdir -p build
  cd build
  cmake .. -DUSE_QT5=ON -DCMAKE_INSTALL_PREFIX=/usr
  nbthreads=$(cat /proc/cpuinfo | grep processor | wc -l)
  make -j$nbthreads DESTDIR="$pkgdir/" install
}


