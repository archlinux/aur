# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.30.3
pkgrel=1
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('gettext' 'boost-libs' 'libgdamm' 'libxml++' 'python-gobject'
         'libepc' 'goocanvasmm' 'gtksourceviewmm' 'evince' 'postgresql')
makedepends=('intltool' 'python-sphinx' 'boost' 'itstool' 'libgda-postgres'
             'libgda-mysql')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('27148ad084ac1c300a4dfe4b4bc3c6bbb1b13fbe279fe1ce25818f2251c6085e')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --with-postgres-utils=/usr/bin \
    --disable-scrollkeeper \
    --disable-update-mime-database \
    --disable-static
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
