# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=rgbepp
_pkgname=RGBEPP
pkgver=0.0.3
pkgrel=1
pkgdesc="Reference Genome based Exon Phylogeny Pipeline"
arch=('x86_64')
url="https://github.com/starsareintherose/$_pkgname"
license=('GPL-2.0-only')
depends=('fastp' 'spades' 'diamond' 'bowtie2' 'macse' 'samtools' 'bcftools' 'trimal')
optdepends=('exonerate: for extract exon')
makedepends=('gcc' 'ldc')
source=(https://github.com/starsareintherose/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('c1bbc6758c3fc800c9268d5295f16b637b494d43e931c02652d1a3c748546ae4')
build() {
  cd "$_pkgname-$pkgver"
for dfile in splitfasta.d delstop.d countTaxa.d RGBEPP.d RGBEPP_refmix.d
do
  ldc -O2 --static $dfile
done
  g++ -O2 -o sortdiamond sortdiamond.cpp
}


package(){
  cd "$_pkgname-$pkgver"
for bin in splitfasta delstop countTaxa RGBEPP RGBEPP_refmix sortdiamond
do
  install -Dm755 $bin $pkgdir/usr/bin/$bin
done
}
