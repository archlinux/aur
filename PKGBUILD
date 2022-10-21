# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com> 

pkgname=gsc
pkgver=1.2
pkgrel=5
pkgdesc="All-sky catalog of positions and magnitudes for ~19 million stars and other objects"
url=""http://gsss.stsci.edu/Catalogs/GSC/GSC1/GSC1.htm
license=(GPL2)
arch=(any)
depends=()
makedepends=(cmake)
source=("http://cdsarc.u-strasbg.fr/viz-bin/nph-Cat/tar.gz?bincats/GSC_${pkgver}"
        "gsc.sh")
sha256sums=('SKIP'
            '59387f8ab62f582465ea97e9b586cccb5f0432f9f8158774ac66030e1bb911f8')

build() {
  GSCBIN=/usr/share/GSC/bin
  GSCDAT=/usr/share/GSC
  cd ${srcdir}/src
  make clean
  make
}

package() {
  cd ${srcdir}
  for file in $(find [NS]* -type f); do
    install -v -m 644 -D ${file} "${pkgdir}/usr/share/GSC/${file#source/}"
  done
  install -v -m 755 -D src/gsc.exe "${pkgdir}/usr/share/GSC/bin/gsc"
  install -v -m 644 -D bin/regions.bin "${pkgdir}/usr/share/GSC/bin/regions.bin"
  install -v -m 644 -D bin/regions.ind "${pkgdir}/usr/share/GSC/bin/regions.ind"
  install -v -m 644 -D gsc.sh "${pkgdir}/etc/profile.d/gsc.sh"
}
