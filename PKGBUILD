# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=regexxer
pkgver=0.10
pkgrel=2
pkgdesc="Interactive search and replace tool for GNOME"
arch=('i686' 'x86_64')
url="http://regexxer.sourceforge.net/"
license=('GPL')
depends=('gtksourceviewmm' 'dconf' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('2a7832541a0306b3d4eb63a1cf8978d7bbfc7927e9304473fe801d71fd99736c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '/GLIB_COMPILE_SCHEMAS/ d' Makefile.in

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
