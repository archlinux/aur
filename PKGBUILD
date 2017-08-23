# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=libad9361-iio-git
_gitname=libad9361-iio
pkgver=20170207 
pkgrel=1
pkgdesc="A simple userspace library for multi-chip sync on platforms (FMCOMMS5) with multiple AD9361 devices."
url="https://github.com/analogdevicesinc/libad9361-iio"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libiio')
makedepends=('git' 'cmake')
provides=('libad9361-iio')
conflicts=('libad9361-iio')
source=("git+https://github.com/analogdevicesinc/libad9361-iio.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}


build() {
  cd "$_gitname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
  make
}

package() {
  cd "$_gitname/build"
  make DESTDIR="${pkgdir}" install
}
