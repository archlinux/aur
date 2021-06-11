# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Mark Rosenstand <mark@archlinux.org>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=krb5-auth-dialog
pkgver=3.26.1
pkgrel=2
pkgdesc="Monitors Kerberos tickets and pops up a dialog when they are about to expire."
arch=('i686' 'x86_64')
url="https://honk.sigxcpu.org/piki/projects/krb5-auth-dialog/"
license=('GPL')
depends=('gtk3' 'libnotify')
makedepends=('gettext' 'intltool' 'pkgconfig' 'yelp-tools')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('ddb0b6813c833559d5deab52259bc2868b994b44c8e13eaa8a10bb58b77e21f1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --disable-schemas-compile \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-pkinit \
    --disable-network-manager

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
