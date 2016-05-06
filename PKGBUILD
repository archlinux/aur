# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.48.1
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libproxy gnutls ca-certificates gsettings-desktop-schemas)
makedepends=(intltool)
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('cf9923ab9860011c5af6d58b0aa1db693d353f2008014a3dcb07af1952bea44a')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/$pkgname --disable-static \
    --disable-installed-tests
  make
}

check() {
  cd $pkgname-$pkgver
  make -j1 -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install testfiles_DATA=
}

# vim:set ts=2 sw=2 et:
