# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Mark Rosenstand <mark@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=krb5-auth-dialog
pkgver=3.20.0
pkgrel=1
pkgdesc="Monitors Kerberos tickets and pops up a dialog when they are about to expire."
arch=('i686' 'x86_64')
url="https://honk.sigxcpu.org/piki/projects/krb5-auth-dialog/"
license=('GPL')
depends=('gtk3' 'libnm-glib' 'libnotify')
makedepends=('gettext' 'intltool' 'pkgconfig' 'yelp-tools')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('622f29e61d709f2d5da1b362ed268a974964837deb0849aef99d2f7e0e2291f7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --disable-schemas-compile \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-pkinit \
    --enable-network-manager

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
