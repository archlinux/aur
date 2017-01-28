# Maintainer: Jonas Frei freijon <freijon@gmail.com>
# Contributor: : carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-indicator-bzr
pkgver=r23
pkgrel=1
pkgdesc="Provides an indicator for Haguichi. Development version."
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'haguichi')
makedepends=('bzr' 'cmake' 'vala')
conflicts=('haguichi-indicator')
provides=('haguichi-indicator')
source=('bzr+lp:haguichi-indicator')
sha256sums=('SKIP')
_pkg=haguichi-indicator

pkgver() {
  cd $srcdir/$_pkg

  echo "r$(bzr revno)"
}

build() {
  rm -rf $srcdir/$_pkg/build
  mkdir $srcdir/$_pkg/build
  cd $srcdir/$_pkg/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $srcdir/$_pkg/build DESTDIR="$pkgdir" install
}
