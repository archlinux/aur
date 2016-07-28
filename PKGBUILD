# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.12.2
pkgrel=2
pkgdesc="Library for OpenPGP prompts"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/libcryptui"
license=('GPL')
depends=('gtk3' 'gpgme' 'dbus-glib' 'libnotify' 'libgnome-keyring' 'dconf' 'libsm')
makedepends=('intltool' 'gobject-introspection' 'gnome-common')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz
        gnupg.patch)
sha256sums=('71ead1a7b496f07f6c5102ae79945dd2515b7b9342c6edefe58b47318be20866'
            '468e8d7730c50e6ba8da7a3deb948ab1244fb06fbce9acd2c983a93beb2b0f38')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../gnupg.patch
  autoreconf -fvi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
