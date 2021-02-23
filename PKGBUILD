# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=ThePEG
pkgname=thepeg
pkgver=2.2.2
pkgrel=1
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("x86_64")
url="http://thepeg.hepforge.org"
license=('GPL2')
depends=("gsl" "fastjet" "lhapdf" "hepmc" "boost")
optdepends=("rivet" "zlib")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('70fa179dc1712b27549d1949c6f144cb899c372ec46606ab6b7dbcbf348961562a0a3ed769bdd8f8b8d62c07859a67c5e646ab357a9cbdd0644e557670fe3a3e')

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
