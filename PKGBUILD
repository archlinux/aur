# Contributor: Angelo "Encelo" Theodorou <encelo@users.sourceforge.net>
# Contributor: Alessio 'alexwizard' Sergi <sergi.alessio {at} gmail.com>
# Contributor: Eran Yahav <eran910@gmail.com>

pkgname=gnome-gmail-notifier
pkgver=0.10.1
pkgrel=2
pkgdesc="A Gmail Inbox Monitor for the GNOME2 desktop"
arch=('i686' 'x86_64')
url="http://notifier.geekysuavo.org/"
license=('GPL2')
depends=('gconf' 'libgnome-keyring' 'gstreamer0.10-good-plugins' 'libnotify' 'libsoup')
makedepends=('intltool')
source=(http://files.geekysuavo.org/notifier/${pkgname}-${pkgver}.tar.bz2 libnotify.patch)
md5sums=('697dea845b968af0f3526bad36f5855a' '808d1fd8ff9ff5d63c661a3351922ff0')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./autogen.sh && ./configure --prefix=/usr || return 1
  patch  -p1 < ../libnotify.patch

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
