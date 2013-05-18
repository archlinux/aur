# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.24.0
pkgrel=1
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('gettext' 'boost-libs' 'libgdamm' 'libxml++' 'python2-gobject' 'libepc' 'goocanvasmm' 'gtksourceviewmm' 'evince' 'postgresql')
makedepends=('intltool' 'gnome-doc-utils' 'python-sphinx' 'boost')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/1.24/$pkgname-$pkgver.tar.xz)
sha256sums=('83ff79610ffdede48536c0d07d5288ad84ec26c86aa2aa1db98b46abdebbdcc2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --with-postgres-utils=/usr/bin \
    --disable-scrollkeeper \
    --disable-update-mime-database \
    --disable-static \
    PYTHON=python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
