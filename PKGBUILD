# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.41.92
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libproxy gnutls ca-certificates gsettings-desktop-schemas)
makedepends=(intltool)
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('8f9a5bf8c34dcc7378044aa6ae3e327643d4c973463e655328c4c574d91485de')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/$pkgname --disable-static \
    --disable-installed-tests
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install testfiles_DATA=
}

# vim:set ts=2 sw=2 et:
