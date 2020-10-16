# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=ThePEG
pkgname=thepeg
pkgver=2.2.1
pkgrel=1
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("x86_64")
url="http://thepeg.hepforge.org"
license=('GPL2')
depends=("gsl" "fastjet" "lhapdf" "hepmc" "boost")
optdepends=("rivet" "zlib")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('cdc4a280b048a12b2aa75bf9b848ae28376bae0e5e0d8ddfbd446f36920676dd25c79c232bfdca08ff7e059b11fbc16420fee9923717211798ceb4c560e3d817')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --with-hepmc=/usr --with-hepmcversion=3
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
