# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-mouse-touchpad-bzr
pkgver=r25
pkgrel=1
pkgdesc='Mouse & Touchpad plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-mouse-touchpad'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-mouse-touchpad')
conflicts=('switchboard-plug-mouse-touchpad')
source=('bzr+lp:switchboard-plug-mouse-touchpad')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-mouse-touchpad

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-mouse-touchpad

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
  cd switchboard-plug-mouse-touchpad/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
