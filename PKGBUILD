# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
pkgname=glib-networking
pkgver=2.28.7
pkgrel=4
pkgdesc="Network-related giomodules for glib"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('glib2' 'libproxy' 'gnutls' 'libgcrypt' 'ca-certificates' 'gsettings-desktop-schemas')
makedepends=('intltool')
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-${pkgver}.tar.bz2
        glib-networking-2.29.9-port-gnutls3-API.patch)
sha256sums=('98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c'
            '101daf107773f84d08d7ab55a354875e2e021c3b5dd3cdc259fb544f94a8beee')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/glib-networking-2.29.9-port-gnutls3-API.patch"
  ./configure \
    --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/glib-networking --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
