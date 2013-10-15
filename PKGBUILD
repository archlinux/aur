# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.38.1
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libproxy gnutls ca-certificates gsettings-desktop-schemas)
makedepends=(intltool)
options=('!libtool')
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('32ea1e504f69ff6693ac4119ad598ded50bb0440cf4484d28ef0adf8fcc85653')

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
