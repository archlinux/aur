# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=glib-networking
pkgver=2.42.1
pkgrel=1
pkgdesc="Network-related giomodules for glib"
arch=(i686 x86_64)
url="http://www.gtk.org/"
license=(GPL2)
depends=(glib2 libproxy gnutls ca-certificates gsettings-desktop-schemas)
makedepends=(intltool)
install=glib-networking.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz
        skip-test-needs-glib-243.patch)
sha256sums=('c06bf76da3353695fcc791b7b02e5d60c01c379e554f7841dc6cbca32f65f3a0'
            'afa882168bcb1f8abed27c63455c3ac177787e305ddb76744d7936a121866410')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../skip-test-needs-glib-243.patch
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
