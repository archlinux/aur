# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-files-bzr
pkgver=r2107
pkgrel=1
pkgdesc='The Pantheon File Manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-files'
license=('GPL3')
groups=('pantheon-unstable')
depends=('atk' 'cairo' 'dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2'
         'glibc' 'gtk3' 'libcanberra' 'libgee' 'libnotify' 'pango' 'plank'
         'sqlite' 'zeitgeist'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'gnome-common' 'granite-bzr' 'vala')
optdepends=('contractor-bzr: Various context menu entries'
            'tumbler: Thumbnails generation')
provides=('pantheon-files')
conflicts=('pantheon-files')
install='pantheon-files.install'
source=('bzr+lp:pantheon-files')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-files

  echo "r$(bzr revno)"
}

build() {
  cd pantheon-files

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DCMAKE_SKIP_RPATH='TRUE' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd pantheon-files/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
