# Maintainer: Haoda Wang <haoda.wang jpl.nasa.gov>

pkgname=cspice
pkgver="N0067"
pkgrel=2
pkgdesc="A comprehensive toolkit and api to design, simulate and analyse space missions"
arch=("x86_64")
url="https://naif.jpl.nasa.gov/naif/aboutspice.html"
depends=("glibc" "f2c")
makedepends=("tcsh")
source=("http://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z")
sha1sums=('a104e4795abdd0aae3b6e8163fbfea8f08558c79')


build() {
  cd "cspice"
  ./makeall.csh
}

package() {
  cd "cspice"
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share/doc"

  cp -R data "$pkgdir/usr/share/cspice"
  cp -R doc "$pkgdir/usr/share/doc/cspice"
  cp -R exe "$pkgdir/usr/bin"
  cp -R include "$pkgdir/usr/"
  cp -R lib "$pkgdir/usr/"
  rm "$pkgdir/usr/include/f2c.h" #we remove the vendorized header and rely on the library package to supply it instead
}
