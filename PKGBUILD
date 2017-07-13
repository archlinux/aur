# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=ThePEG
pkgname=thepeg
pkgver=2.1.0
pkgrel=1
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("i686" "x86_64")
url="http://thepeg.hepforge.org"
license=('GPL2')
depends=("gsl" "lhapdf" "hepmc" "rivet" "zlib" "fastjet" "boost")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('9fce3280121cc3f4863b53ecd70bcc6f6eec14fc3547961e03d0915da4887596e1b3691d99c95a8b222bc9bfa756cd71e531ae5f5e35e020c1edf21c2077c408')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-lhapdf=/usr --with-fastjet=/usr --enable-unitchecks
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
