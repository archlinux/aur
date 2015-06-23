# Maintainer: sxe (sxxe@gmx.de)

pkgname=recollrunner
pkgver=0.6
pkgrel=1
pkgdesc="Simple, down-and-dirty Recoll plugin for Krunner."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=128203"
depends=('kdebase-workspace' 'recoll')
makedepends=('cmake' 'make' 'automoc4')
install=$pkgname.install
source=(http://opendesktop.org/CONTENT/content-files/128203-$pkgname-$pkgver.tar.bz2
                gcc.patch)
license=('GPL')

build() {

  msg2 "Patching..."
  (
    cd "$srcdir"
    patch < gcc.patch
  )

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make VERBOSE=1
  make DESTDIR=$pkgdir install
}

md5sums=('3826a01e5864b96bc170426bc3d3f370'
         '76525e7bd3ea371d5a98d2e632e5367f')
