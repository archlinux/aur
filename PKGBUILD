# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.16.1
pkgrel=5
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('libgdamm>=3.99.21' 'libxml++>=2.30.1' 'gconfmm>=2.28.2' 'pygtk'
         'python2-gda' 'libgtksourceviewmm2' 'goocanvasmm' 'libepc' 
         'iso-codes' 'postgresql' 'hicolor-icon-theme' 'shared-mime-info'
         'gtkmm>=2.22.0' 'boost-libs>=1.45' 'gettext')
makedepends=('intltool' 'gnome-doc-utils>=0.20.2' 'boost>=1.45' 'python-sphinx' 'glibmm-docs')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/glom/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
md5sums=('9ae56e0886f14a48cedaef9beb9c3cc9')

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
