# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Riley Trautman <asonix@tamu.edu>

pkgname=pantheon-mail-bzr
pkgver=r2024
pkgrel=1
pkgdesc='The Pantheon Mail Client'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-mail'
license=('GPL3')
depends=('cairo' 'gcr' 'gdk-pixbuf2' 'glib2' 'glibc' 'gmime' 'gnome-keyring'
         'gtk3' 'libcanberra' 'libgee' 'libnotify' 'libsecret' 'libxml2'
         'pango' 'sqlite' 'webkitgtk'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'gnome-doc-utils' 'gobject-introspection'
             'granite-bzr' 'intltool' 'vala')
provides=('pantheon-mail')
conflicts=('pantheon-mail')
install='pantheon-mail.install'
source=('bzr+lp:pantheon-mail')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-mail

  echo "r$(bzr revno)"
}

prepare() {
  cd pantheon-mail

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-mail/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DDESKTOP_UPDATE='FALSE' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DGSETTINGS_COMPILE_IN_PLACE='FALSE'
  make
}

package() {
  cd pantheon-mail/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
