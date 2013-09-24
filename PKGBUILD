# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.10.0
pkgrel=1
pkgdesc="Library for OpenPGP prompts"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/libcryptui/"
license=('GPL')
depends=('gtk3' 'gpgme' 'dbus-glib' 'libnotify' 'libgnome-keyring' 'dconf')
makedepends=('intltool' 'gobject-introspection')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('ceeba7ebdcda768d671e9df9332b18d4f25edd1f4d91e86a241c3c1f3ffc6332')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
