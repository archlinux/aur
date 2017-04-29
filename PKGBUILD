# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-keyboard-bzr
pkgver=r353
pkgrel=1
pkgdesc='Keyboard plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-keyboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'switchboard-bzr' 'vala')
provides=('switchboard-plug-keyboard')
conflicts=('switchboard-plug-keyboard')
source=('bzr+lp:switchboard-plug-keyboard')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-keyboard

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-keyboard

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
  cd switchboard-plug-keyboard/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
