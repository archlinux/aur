# Maintainer: Yaron de Leeuw <jdlmail@gmail.com>
# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>
# Contributor: Adriano Foschi <adriano.src gmail com>
# Contributor: Ismael Carnales <icarnales@gamail.com

pkgname=pidgin-light
pkgver=2.10.8
pkgrel=1
pkgdesc="A light pidgin version: msn, jabber, irc supported protocols without gstreamer, tcl, tk, xscreensaver support.No video/voice.  Includes finch "
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'libidn' 'nss' 'python' 'gtkspell' 'hicolor-icon-theme' 'libxml2')
makedepends=('ca-certificates' 'perl-xml-parser' 'intltool')
optdepends=('dbus-python: needed for purple-remote & purple-url-handler only' 'gstreamer0.10-good: sound')
replaces=('gaim')
provides=('pidgin' 'finch' 'libpurple')
conflicts=('pidgin' 'pidgin-msn' 'pidin-light-msn' 'finch' 'libpurple')
options=('!libtool')
install=pidgin-light.install
source=(http://downloads.sourceforge.net/project/pidgin/Pidgin/$pkgver/pidgin-$pkgver.tar.bz2 pidgin-light.install )

md5sums=('384be5689e62a9d4d42320e4ca90433d'
         '8cc4ec58d3288bb171fc8359c25674f7')

build() {

    cd "$srcdir/pidgin-$pkgver"

    # Pidgin doesn't explicitly link to libm
    LDFLAGS+=' -Wl,--copy-dt-needed-entries'

    ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install\
    --disable-meanwhile --disable-screensaver --disable-nm\
    --disable-gnutls --disable-doxygen --disable-tcl --disable-tk --disable-vv\
    --disable-avahi --disable-gstreamer\
    --disable-farstream --with-system-ssl-certs=/etc/ssl/certs 
    make 
}
package() {
cd "$srcdir/pidgin-$pkgver" 
   make DESTDIR="$pkgdir" install

# Remove GConf schema file
  rm -rf "$pkgdir/etc"
}

# vim:set ts=2 sw=2 et:

