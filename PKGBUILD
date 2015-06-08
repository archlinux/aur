# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: dorkfish <dork.fish.wat@gmail.com>

pkgname=bamf-bzr
pkgver=r613
pkgrel=1
pkgdesc='Application matching framework'
arch=('i686' 'x86_64')
url='https://launchpad.net/bamf'
license=('GPL')
depends=('dbus-glib' 'libgtop' 'libwnck3' 'python2-lxml')
makedepends=('bzr' 'gnome-common' 'gobject-introspection' 'gtk-doc' 'vala')
provides=('bamf')
conflicts=('bamf')
source=('bzr+lp:bamf')
sha256sums=('SKIP')

pkgver() {
  cd bamf

  echo "r$(bzr revno)"
}

prepare() {
  cd bamf

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' tests/gtester2xunit.py
}

build() {
  cd bamf

  export PYTHON=/usr/bin/python2

  ./autogen.sh \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib/bamf' \
    --sysconfdir='/etc' \
    --disable-static
  make
}

package() {
  cd bamf

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
