# Maintainer: Sauliusl <luksaulius[at]gmail[dot]com>
pkgname=pash-mapper
pkgver=3.01.01
pkgrel=2
pkgdesc="A versatile software package for read mapping and integrative analysis of genomic and epigenomic variation using massively parallel DNA sequencing"
url="http://www.biomedcentral.com/1471-2105/11/572"
arch=('x86_64' 'i686')
license=('custom')
depends=()
optdepends=('ruby: necessary to run lffMerger.rb, pashToLff.rb, and buildFastaIndex.rb')
makedepends=('poppler')
conflicts=()
replaces=()
backup=()
install=''
source=("http://www.brl.bcm.tmc.edu/pash/download/<UNIQUE_CODE>/pash-${pkgver}.tgz") # Obtain the link from http://www.brl.bcm.tmc.edu/pash/pashDownload.rhtml
sha1sums=('b770ae65482f8aa3499606c07caa00fa2f84b3f0')

build() {
  cd "pash-${pkgver}/"
  pdftotext doc/Pash3_license.pdf ../LICENSE
  cd src/
  sed -i s/g++-4.8/g++/ Makefile.include 
  sed -i s/gcc-4.8/gcc/ Makefile.include
  sed -i s/-Wl,-Bstatic// Makefile.include 
  make
}
package() {
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd "pash-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install -Dm0755 src/pash/pash3 ${pkgdir}/usr/bin/pash3
  install -Dm0755 src/util/pash3_keyFreq ${pkgdir}/usr/bin/pash3_keyFreq
  install -Dm0755 src/util/pash3_makeIgnoreList ${pkgdir}/usr/bin/pash3_makeIgnoreList

  install -Dm0755 bin/pash3_getRCChrom.rb ${pkgdir}/usr/bin/pash3_getRCChrom.rb
  install -Dm0755 bin/pash3_splitFastq.rb ${pkgdir}/usr/bin/pash3_splitFastq.rb 
}

# vim:set ts=2 sw=2 et: