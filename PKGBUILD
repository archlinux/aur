# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Yaron de Leeuw < me@jarondl.net >
# Maintained at : https://github.com/funilrys/PKGBUILD/tree/master/pidgin-light
# Lately maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>
# Contributor: Adriano Foschi <adriano.src gmail com>
# Contributor: Ismael Carnales <icarnales@gamail.com

pkgname=pidgin-light
pkgver=2.12.0
pkgrel=1
pkgdesc="A light pidgin version: msn, jabber, irc supported protocols without gstreamer, tcl, tk, xscreensaver support.No video/voice.  Includes finch "
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'libidn' 'nss' 'python' 'gtkspell'
         'hicolor-icon-theme' 'libxml2' 'gtk-update-icon-cache')
makedepends=('ca-certificates' 'perl-xml-parser' 'intltool' 'pkg-config')
optdepends=('dbus-python: needed for purple-remote & purple-url-handler only' 'gstreamer0.10-good: sound')
replaces=('gaim')
provides=('pidgin' 'finch' 'libpurple')
conflicts=('pidgin' 'pidgin-msn' 'pidin-light-msn' 'finch' 'libpurple')
options=('!libtool')
install='pidgin-light.install'
source=("http://downloads.sourceforge.net/project/pidgin/Pidgin/${pkgver}/pidgin-${pkgver}.tar.bz2" )

sha512sums=('e87b39888432982ee36332fd14b272f49f7974de9e8694f7fe3bec2821748d6e6026ac5a63615a93386a033d6ee7c4de5ae0a86b725f63b9cc55650f0ab94b06')

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
