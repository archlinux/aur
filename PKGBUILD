# Maintainer: Jonas Frei freijon <freijon@gmail.com>
# Contributor: : carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-bzr
pkgver=r68
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux. Development version."
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('bzr' 'cmake' 'vala')
conflicts=('haguichi')
provides=('haguichi')
install=$pkgname.install
source=('bzr+lp:haguichi/1.3')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/1.3

  echo "r$(bzr revno)"
}

build() {
  rm -rf $srcdir/1.3/build
  mkdir $srcdir/1.3/build
  cd $srcdir/1.3/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DICON_UPDATE=OFF -DGSETTINGS_COMPILE=OFF
  make
}

package() {
  make -C $srcdir/1.3/build DESTDIR="$pkgdir" install
}
