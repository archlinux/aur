# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com> 

pkgname=gsc
pkgver=1.2
pkgrel=1
pkgdesc="All-sky catalog of positions and magnitudes for ~19 million stars and other objects"
url=""http://gsss.stsci.edu/Catalogs/GSC/GSC1/GSC1.htm
license=(GPL2)
arch=(i686 x86_64)
depends=()
makedepends=(cmake)
source=("http://cdsarc.u-strasbg.fr/viz-bin/nph-Cat/tar.gz?bincats/GSC_${pkgver}")
sha256sums=('b2e360a22148a1d669304c819b983c5a60e634544068f2f5eaf38afc53482f5d')

build() {
  GSCBIN=/usr/share/GSC/bin
  GSCDAT=/usr/share/GSC
  cd ${srcdir}/src
  make clean
  make
}

package() {
  cd ${srcdir}
  for file in $(find N* -type f); do
    install -v -m 644 -D ${file} "${pkgdir}/usr/share/GSC/${file#source/}"
  done
  install -v -m 755 -D src/gsc.exe "${pkgdir}/usr/share/GSC/bin/gsc"
  install -v -m 644 -D bin/regions.bin "${pkgdir}/usr/share/GSC/bin/regions.bin"
  install -v -m 644 -D bin/regions.ind "${pkgdir}/usr/share/GSC/bin/regions.ind"
}
