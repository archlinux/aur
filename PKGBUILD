# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Mark Rosenstand <mark@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=krb5-auth-dialog
pkgver=3.15.4
pkgrel=1
pkgdesc="Monitors Kerberos tickets and pops up a dialog when they are about to expire."
arch=('i686' 'x86_64')
url="https://honk.sigxcpu.org/piki/projects/krb5-auth-dialog/"
license=('GPL')
depends=('gtk3' 'libnm-glib' 'libnotify')
makedepends=('gettext' 'gnome-doc-utils' 'intltool' 'pkgconfig')
install=$pkgname.install
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('0bdb448303dbf0ff536e699dfc9016b72e91ba881fffd75eb86ec9ab868c3062')

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
