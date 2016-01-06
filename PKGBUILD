# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-terminal-bzr
pkgver=r803
pkgrel=1
pkgdesc='The Pantheon Terminal Emulator'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-terminal'
license=('GPL3')
groups=('pantheon-unstable')
depends=('desktop-file-utils' 'glib2' 'glibc' 'gtk3' 'libnotify' 'pango' 'vte3'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('pantheon-terminal')
conflicts=('pantheon-terminal')
install='pantheon-terminal.install'
source=('pantheon-terminal::bzr+lp:pantheon-terminal')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-terminal

  echo "r$(bzr revno)"
}

build() {
  cd pantheon-terminal

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd pantheon-terminal/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
