# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
# Maintainer: Clément Démoulins <clement@archivel.fr>
# Contributor: wzff
# Contributor: BluePeppers
# Contributor: n0nsense
# Contributor: Magicking

pkgname=libpurple-minimal
pkgver=2.13.0
pkgrel=1
pkgdesc="minimal build of the pidgin IM library (no gstreamer, perl and X11 dependencies)"
arch=('i686' 'x86_64')
url="http://developer.pidgin.im/wiki/WhatIsLibpurple"
license=('GPL')
options=('!libtool')
depends=('glib2' 'libsasl' 'libxml2' 'libidn' 'nss')
makedepends=('ca-certificates' 'intltool')
optdepends=('ca-certificates: SSL CA certificates')
conflicts=('pidgin' 'libpurple')
provides=("libpurple=${pkgver}")
source=("http://downloads.sourceforge.net/pidgin/pidgin-${pkgver}.tar.gz")
sha256sums=('83f3e206cdd373c0ac1878a1f04b5a5c877e2260b102d1c6d013e464d91903a3')

build(){
  cd "$srcdir/pidgin-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-gnutls \
    --enable-cyrus-sasl \
    --disable-nls \
    --disable-gtkui \
    --disable-consoleui \
    --disable-screensaver \
    --disable-sm \
    --disable-startup-notification \
    --disable-gtkspell \
    --disable-gestures \
    --disable-schemas-install \
    --disable-gstreamer \
    --disable-gstreamer-interfaces \
    --disable-farstream \
    --disable-vv \
    --disable-meanwhile \
    --disable-avahi \
    --disable-dbus \
    --disable-perl \
    --disable-tcl \
    --disable-tk \
    --without-x \
    --disable-doxygen \
    --with-system-ssl-certs=/etc/ssl/certs
  make -C libpurple
  make -C share/ca-certs
}

package() {
  cd "$srcdir/pidgin-${pkgver}"
  make -C libpurple DESTDIR="$pkgdir" install
  make -C share/ca-certs DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
