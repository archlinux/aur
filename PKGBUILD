# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=ThePEG
pkgname=thepeg
pkgver=2.2.3
pkgrel=1
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("x86_64")
url="http://thepeg.hepforge.org"
license=('GPL2')
depends=("gsl" "fastjet" "lhapdf" "hepmc" "boost")
optdepends=("rivet" "zlib")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('143f9a4974e5aa44c8957edd1ac8c621ce298cec8d1aaef39bb7061448e730a90cdb453c9fbf43caa2cf8e5757910584d91a908520bb540ff8e4a67a22455bb4')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --with-hepmc=/usr \
              --with-hepmcversion=3
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
