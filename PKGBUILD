# Maintainer: Alexandre Moine < nobrakal at moine dot org >
# Contributor: Tasos Latsas < tlatsas2000 at gmail dot com >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com}

pkgname=tuxmath
pkgver=2.0.3
pkgrel=3
pkgdesc="An arcade game that helps kids practice their math facts"
arch=('i686' 'x86_64')
url="https://github.com/tux4kids/tuxmath/"
license=('GPL' 'custom:OFL' 'custom')
depends=('t4kcommon')
makedepends=('make')
options=('!docs')
source=(https://github.com/tux4kids/$pkgname/archive/upstream/$pkgver.tar.gz)
sha256sums=('ab91bd6df17eb9377e5608701030bd32110a3588933bf0e4c26b5697fb2a4698')

build() {
  cd "$srcdir/${pkgname}-upstream-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-upstream-$pkgver"

  make DESTDIR=$pkgdir install

  # install .desktop file and icons
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  install -D -m644 tuxmath.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 data/images/icons/icon.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # Install doc
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -D -m644 doc/README \
   $pkgdir/usr/share/doc/$pkgname/README

  # install licenses
  install -D -m644 doc/OFL \
    $pkgdir/usr/share/licenses/$pkgname/OFL
  install -D -m644 doc/README_DATA_LICENSES \
    $pkgdir/usr/share/licenses/$pkgname/DATA_LICENSES
}
