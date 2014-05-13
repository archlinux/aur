# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.12.2
pkgrel=1
pkgdesc="Library for OpenPGP prompts"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/libcryptui/"
license=('GPL')
depends=('gtk3' 'gpgme' 'dbus-glib' 'libnotify' 'libgnome-keyring' 'dconf' 'libsm')
makedepends=('intltool' 'gobject-introspection')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('71ead1a7b496f07f6c5102ae79945dd2515b7b9342c6edefe58b47318be20866')

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
