# $Id$
# Maintainer: Leonardo Damián Barberón (damian01w) <damian01w@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=rygel024
_pkgname=rygel
pkgver=0.24.0
pkgrel=1
pkgdesc="UPnP AV MediaServer and MediaRenderer that allows you to easily share audio, video and pictures, and control of media player on your home network"
arch=(i686 x86_64)
url="http://live.gnome.org/Rygel"
license=(LGPL)
depends=(gupnp-av gupnp-dlna libgee gtk3 libunistring libtracker-sparql hicolor-icon-theme xdg-utils libmediaart1)
makedepends=(vala intltool python2 gobject-introspection)
optdepends=('gst-plugins-base: Extra media codecs'
            'gst-plugins-good: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'            
            'gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'tracker: Share indexed media files')
backup=(etc/rygel.conf)
conflicts=('rygel>=0.24.0')
install=rygel.install
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
sha256sums=('98d63c8ee0532abb8f603e18fca3a9d8101a0674e2fc3e0fd88f280a4217f1b0')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --enable-mediathek-plugin --enable-gst-launch-plugin
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

