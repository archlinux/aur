# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=TAUOLA
pkgname=tauola++
pkgver=1.1.8
pkgrel=1
pkgdesc="C++ Interface to Tauola"
arch=("x86_64")
url="http://tauolapp.web.cern.ch/tauolapp"
license=('GPL3')
depends=(gcc-fortran hepmc lhapdf pythia8)
source=("http://tauolapp.web.cern.ch/tauolapp/resources/${_pkgname}.$pkgver/${_pkgname}.$pkgver-LHC.tar.gz")
sha256sums=('3f734e8a967682869cca2c1ffebd3e055562613c40853cc81820d8b666805ed5')

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr \
              --without-hepmc \
              --with-hepmc3=/usr \
              --with-lhapdf=/usr \
              --with-pythia8=/usr

  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
