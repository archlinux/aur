# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: FadeMind <fademind at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: bitwave <aur at oomlu dot de>
# Contributor: willemw <willemw12 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=("libappindicator-bzr")
pkgver=296
pkgrel=1
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray'
url='https://launchpad.net/libappindicator'
arch=('x86_64')
license=('LGPL2.1' 'LGPL3')
makedepends=('dbus-glib' 'gobject-introspection' 'libdbusmenu-gtk3' 'libindicator-gtk3' 'vala' 'gnome-common' 'gtk-sharp-2' 'gtk-sharp-3' 'perl-xml-libxml')
options=('!emptydirs')
source=('bzr+lp:libappindicator')
conflicts=('libappindicator-gtk3')
replaces=('libappindicator-gtk3')
provides=('libappindicator-gtk3')

sha512sums=('SKIP')

pkgver() {
  cd libappindicator
  bzr revno
}

build() {
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  (cd libappindicator
    ./autogen.sh --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --with-gtk=3
    make
  )
}

package() {
  pkgdesc+=' (GTK+ 3 library)'
  depends=('libdbusmenu-gtk3' 'libindicator-gtk3')

  cd libappindicator
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
