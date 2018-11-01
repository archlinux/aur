# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Riley Trautman <asonix@tamu.edu>

pkgname=pantheon-mail-git
pkgver=r118.ace22983
pkgrel=1
pkgdesc='The Pantheon Mail Client'
arch=('x86_64')
url='https://github.com/elementary/mail'
license=('GPL3')
depends=(
  'cairo' 'evolution-data-server' 'folks' 'gcr' 'gdk-pixbuf2' 'glib2' 'gtk3'
  'libcanberra' 'libgee' 'libsecret' 'libxml2' 'pango' 'sqlite' 'webkit2gtk'
  'libgranite.so'
)
makedepends=(
  'git' 'gnome-doc-utils' 'gobject-introspection' 'granite-git' 'intltool'
  'meson' 'vala'
)
provides=('pantheon-mail')
conflicts=('pantheon-mail')
source=('pantheon-mail::git+https://github.com/elementary/mail.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-mail

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson pantheon-mail build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
