# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.46.0
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libproxy gnutls ca-certificates gsettings-desktop-schemas)
makedepends=(intltool)
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz
        0001-gnutls-Switch-backend-priorities-so-gnutls-pkcs11-is.patch)
sha256sums=('3655526d6dbfc697c22cd9b279e14599f8449f5802b12d84485bdc52d96482f0'
            '5d12c3b8905f67a93adc884920f7e062404b723e9d2e56f935b914e58a20b29e')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../0001-gnutls-Switch-backend-priorities-so-gnutls-pkcs11-is.patch
}

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
