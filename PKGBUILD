# Maintainer: Michal Lisowski <lisu87@gmail.com>
# Contributor: Angelo "Encelo" Theodorou <encelo@users.sourceforge.net>
# Contributor: Alessio 'alexwizard' Sergi <sergi.alessio {at} gmail.com>
# Contributor: Eran Yahav <eran910@gmail.com>
# Contributor: Rob Lynn <rob22uk at gmail dot com>

pkgname=gnome-gmail-notifier
pkgver=0.10.1
pkgrel=4
pkgdesc="A Gmail Inbox Monitor for the GNOME2 desktop"
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/gnome-gmail-notifier/"
license=('GPL2')
depends=('gconf' 'gtk2' 'gstreamer0.10-good' 'libgnome-keyring' 'libnotify' 'libsoup')
makedepends=('intltool')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gnome-gmail-notifier/${pkgname}-${pkgver}.tar.bz2 libnotify.patch)
md5sums=('697dea845b968af0f3526bad36f5855a' '808d1fd8ff9ff5d63c661a3351922ff0')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch  -p1 < $srcdir/libnotify.patch
}

build() {
  cd $pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
