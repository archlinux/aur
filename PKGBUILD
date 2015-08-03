# Maintainer: Tasos Latsas < tlatsas2000 at gmail dot com >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com}

pkgname=tuxmath
pkgver=2.0.3
pkgrel=1
pkgdesc="An arcade game that helps kids practice their math facts"
arch=('i686' 'x86_64')
url="http://tux4kids.alioth.debian.org/tuxmath/"
license=('GPL' 'custom')
depends=('t4k_common')
makedepends=('make')
options=('!docs')
source=(http://distro.ibiblio.org/slitaz/sources/packages/t/${pkgname}_w_fonts-$pkgver.tar.gz)
sha1sums=('74510bc342d6cefb6dae101cfc8c1207f29d7db9')

build() {
  cd "$srcdir/${pkgname}_w_fonts-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}_w_fonts-$pkgver"

  make DESTDIR=$pkgdir install

  # install .desktop file and icons
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  install -D -m644 tuxmath.desktop $pkgdir/usr/share/applications/tuxmath.desktop
  install -D -m644 data/images/icons/icon.png $pkgdir/usr/share/pixmaps/tuxmath.png

  # install licenses
  install -D -m644 doc/OFL \
    $pkgdir/usr/share/licenses/$pkgname/OFL
  install -D -m644 doc/README_DATA_LICENSES \
    $pkgdir/usr/share/licenses/$pkgname/DATA_LICENSES
}
