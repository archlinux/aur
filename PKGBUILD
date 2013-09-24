# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.8.0
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
sha256sums=('10eed96e33b6d7286795a7c678a5655a86ae099fb98d1f7211aa28aa636c0837')

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
