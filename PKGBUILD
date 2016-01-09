# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-bzr
pkgver=1.3.1
pkgrel=58
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux. Development version."
arch=('x86_64' 'i686' 'arm' 'armv7h')
url="http://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('bzr' 'cmake' 'vala')
conflicts=('haguichi')
provides=('haguichi')
install=$pkgname.install

prepare() {
  cd $srcdir
  bzr branch https://code.launchpad.net/~ztefn/haguichi/trunk bzr
  cd bzr

  rm -rf build
  mkdir build
}

build() {
  cd $srcdir/bzr/build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DICON_UPDATE=OFF -DGSETTINGS_COMPILE=OFF
  make
}

package() {
  make -C $srcdir/bzr/build DESTDIR="$pkgdir" install
}
