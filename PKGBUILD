# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.10.1
pkgrel=2
pkgdesc="Library for OpenPGP prompts"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/libcryptui/"
license=('GPL')
depends=('gtk3' 'gpgme' 'dbus-glib' 'libnotify' 'libgnome-keyring' 'dconf' 'libsm')
makedepends=('intltool' 'gobject-introspection')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('5e3e82e647ac4fb74ed46b4fffbf89e80198f856e1509f5edcd47dd2751a4be0')

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
