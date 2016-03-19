# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-printers-bzr
pkgver=r55
pkgrel=1
pkgdesc='Printers plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-printers'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-printers')
conflicts=('switchboard-plug-printers')
source=('bzr+lp:switchboard-plug-printers')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-printers

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-printers

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
  cd switchboard-plug-printers/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
