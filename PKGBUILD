# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=WHIZARD
pkgname=whizard
pkgver=2.3.1
pkgrel=1
pkgdesc="A program system designed for the efficient calculation of multi-particle scattering cross sections and simulated event samples."
arch=("i686" "x86_64")
url="http://whizard.hepforge.org"
license=('GPL2')
makedepends=(texlive-bin texlive-pictures ghostscript)
depends=(ocaml gcc-fortran pythia lhapdf fastjet looptools hepmc)
source=("http://www.hepforge.org/archive/$pkgname/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6c2889d6c26fe26814f6aeaa34b10bf3d2b1e9b2067df6977bec8edac8e2e7bb')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-lhapdf --enable-hepmc --enable-pythia8 --enable-fastjet --enable-looptools
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
