# Maintainer: Mike Kazantsev <mk.fraggod at gm@il com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
# Maintainer: Clément Démoulins <clement@archivel.fr>
# Contributor: wzff
# Contributor: BluePeppers
# Contributor: n0nsense
# Contributor: Magicking

pkgname=libpurple-minimal
pkgver=2.14.13
pkgrel=1
pkgdesc="Minimal GUI-less build of the Pidgin IM library without gstreamer/perl/X11/etc for bitlbee and such."
arch=(x86_64)
url="http://developer.pidgin.im/wiki/WhatIsLibpurple"
license=(GPL)
options=(!libtool)
depends=(glib2 libsasl libxml2 libidn nss ca-certificates)
conflicts=(pidgin libpurple)
provides=("libpurple=${pkgver}")
source=("http://downloads.sourceforge.net/pidgin/pidgin-${pkgver}.tar.gz")
b2sums=(41b6fa1c3513f4546dbf70b9427593afe949bd7a8ecf693950655a382bae07fffceca97d1f985786437c7df29c641bf84ad39b4e2cf3f30f629d03215fb679d6)

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
