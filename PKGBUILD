# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-power-bzr
pkgver=r255
pkgrel=1
pkgdesc='Power plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-power'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gnome-settings-daemon' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-power')
conflicts=('switchboard-plug-power')
source=('bzr+lp:switchboard-plug-power')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-power

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-power

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
  cd switchboard-plug-power/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
