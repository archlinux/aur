# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Riley Trautman <asonix@tamu.edu>

pkgname=pantheon-mail-git
pkgver=r3159.274ab16b
pkgrel=1
pkgdesc='The Pantheon Mail Client'
arch=('x86_64')
url='https://github.com/elementary/mail'
license=('GPL3')
depends=('cairo' 'gcr' 'gdk-pixbuf2' 'glib2' 'glibc' 'gmime' 'gtk3'
         'libaccounts-glib' 'libcanberra' 'libgee' 'libgsignon-glib'
         'libsecret' 'libxml2' 'pango' 'sqlite' 'webkit2gtk'
         'libgranite.so')
makedepends=('cmake' 'git' 'gnome-doc-utils' 'gobject-introspection'
             'granite-git' 'intltool' 'vala')
provides=('pantheon-mail')
conflicts=('pantheon-mail')
replaces=('pantheon-mail-bzr')
source=('pantheon-mail::git+https://github.com/elementary/mail.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-mail

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
    -DCMAKE_BUILD_TYPE='Release' \
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
