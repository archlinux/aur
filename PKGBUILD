# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=libfm-qt
pkgname=$_pkgname-git
pkgver=0.13.1.144.g62b5fbd
pkgrel=1
pkgdesc='Qt port of libfm, a library providing components to build desktop file managers'
arch=('i686' 'x86_64')
url='https://github.com/lxqt/libfm-qt'
license=('LGPL')
depends=('qt5-x11extras' 'menu-cache' 'libexif')
makedepends=('git' 'cmake' 'qt5-tools' 'lxqt-build-tools-git')
optdepends=(
    'gvfs: support for the trash bin and network devices'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'pcmanfm-qt<=0.10.0')
source=('git+https://github.com/lxqt/libfm-qt.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:-:.:g'
}

build() {
  mkdir -p build ; cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
