# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-display-bzr
pkgver=r107
pkgrel=1
pkgdesc='Display plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-display'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'glib2' 'glibc' 'gnome-desktop' 'gtk3'
         'libgee'
         'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-display')
conflicts=('switchboard-plug-display')
source=('bzr+lp:switchboard-plug-display')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-display

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-display

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
  cd switchboard-plug-display/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
