# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.20.4
pkgrel=1
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('gettext' 'boost-libs' 'libgdamm' 'libxml++' 'python2-gobject' 'libepc' 'goocanvasmm' 'gtksourceviewmm' 'evince' 'postgresql')
makedepends=('intltool' 'gnome-doc-utils' 'python2-sphinx' 'boost')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/glom/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('038d106313774832c56c61312bb387a54cd2ffff50e6c7e56e47bc98b8b8531b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --with-postgres-utils=/usr/bin \
    --disable-scrollkeeper \
    --disable-update-mime-database \
    --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
