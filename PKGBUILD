# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-network-bzr
pkgver=r223
pkgrel=1
pkgdesc='Network plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-networking'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'nm-connection-editor'
         'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-network')
conflicts=('switchboard-plug-network')
source=('switchboard-plug-network::bzr+lp:switchboard-plug-networking')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-network

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-network

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
  cd switchboard-plug-network/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
