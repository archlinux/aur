# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=screenshot-tool-bzr
pkgver=r214
pkgrel=1
pkgdesc='Pantheon screenshot tool'
arch=('i686' 'x86_64')
url='https://launchpad.net/screenshot-tool'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'wayland'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('screenshot-tool')
conflicts=('screenshot-tool')
install='screenshot-tool.install'
source=('bzr+lp:screenshot-tool')
sha256sums=('SKIP')

pkgver() {
  cd screenshot-tool

  echo "r$(bzr revno)"
}

build() {
  cd screenshot-tool

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd screenshot-tool/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
