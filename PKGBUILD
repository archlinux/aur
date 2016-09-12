# Maintainer: Luigi Guevara <@killua99>

pkgname=pantheon-files-loki-bzr
pkgver=r2304
pkgrel=1
pkgdesc='The Pantheon Files for loki'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-files'
license=('GPL3')
depends=('atk' 'cairo' 'dbus-glib' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gtk3' 'libcanberra' 'libgee' 'pango' 'sqlite' 'libgranite.so'
         'zeitgeist' 'contractor' 'tumbler')
makedepends=('bzr' 'cmake' 'gnome-common' 'vala')
optdepends=('contractor: Various context menu entries'
            'tumbler: Thumbnails generation')
provides=('pantheon-files')
conflicts=('pantheon-files')
install='pantheon-files.install'
source=('pantheon-files::bzr+lp:pantheon-files/0.3.x')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-files

  echo "r$(bzr revno)"
}

prepare() {
  cd pantheon-files

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-files/build

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
