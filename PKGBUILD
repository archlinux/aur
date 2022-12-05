# Maintainer: Mike Kazantsev <mk.fraggod at gm@il com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
# Maintainer: Clément Démoulins <clement@archivel.fr>
# Contributor: wzff
# Contributor: BluePeppers
# Contributor: n0nsense
# Contributor: Magicking

pkgname=libpurple-minimal
pkgver=2.14.10
pkgrel=1
pkgdesc="Minimal build of the Pidgin IM library without gstreamer/perl/X11/etc for bitlbee and such."
arch=(x86_64)
url="http://developer.pidgin.im/wiki/WhatIsLibpurple"
license=(GPL)
options=(!libtool)
depends=(glib2 libsasl libxml2 libidn nss ca-certificates)
conflicts=(pidgin libpurple)
provides=("libpurple=${pkgver}")
source=("http://downloads.sourceforge.net/pidgin/pidgin-${pkgver}.tar.gz")
sha256sums=(ae56a0f1c9b8e5826919af3f72aab67aaeb5c541905da5dff28df11d07f0cdef)

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
		--disable-nm \
		--disable-perl \
		--disable-tcl \
		--disable-tk \
		--disable-pixmaps-install \
		--disable-doxygen \
		--disable-dot \
		--disable-devhelp \
		--without-x \
		--with-system-ssl-certs=/etc/ssl/certs
	make -C libpurple
}

package() {
	cd "$srcdir/pidgin-${pkgver}"
	make -C libpurple DESTDIR="$pkgdir" install
}
