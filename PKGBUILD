# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-notes-bzr
pkgver=r10
pkgrel=2
pkgdesc='Pantheon note taking app'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-notes'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'wayland'
         'gtksourceview3'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('pantheon-notes')
conflicts=('pantheon-notes')
install='pantheon-notes.install'
source=('bzr+lp:pantheon-notes')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-notes

  echo "r$(bzr revno)"
}

build() {
  cd pantheon-notes

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
  cd pantheon-notes/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
