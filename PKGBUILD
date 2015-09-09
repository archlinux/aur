# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-datetime-bzr
pkgver=r79
pkgrel=1
pkgdesc='Date & Time plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-datetime')
conflicts=('switchboard-plug-datetime')
source=('bzr+lp:switchboard-plug-datetime')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-datetime

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-datetime

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-datetime/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
