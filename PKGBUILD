# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=gnome-panel
pkgver=3.16.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Legacy GNOME panel"
url="https://wiki.gnome.org/Projects/GnomeFlashback"
depends=('dconf' 'evolution-data-server' 'gconf' 'gnome-desktop' 'gnome-menus' 'librsvg'
         'libwnck3' 'telepathy-glib')
makedepends=('gobject-introspection' 'intltool' 'itstool' 'networkmanager')
optdepends=('gnome-applets: extra applets for the GNOME Panel')
install=$pkgname.install
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('b51997a5db70773606cd72be735902923ae73bd3f2c762ade65695751d4bd162')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-compile \
              PYTHON=/usr/bin/python2 
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

