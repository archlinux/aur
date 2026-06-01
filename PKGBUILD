# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=rgbepp
_pkgname=RGBEPP
pkgver=0.0.4
pkgrel=1
pkgdesc="Reference Genome based Exon Phylogeny Pipeline"
arch=('x86_64')
url="https://github.com/starsareintherose/$_pkgname"
license=('GPL-2.0-only')
depends=('fastp' 'spades' 'diamond' 'bowtie2' 'macse' 'samtools' 'bcftools' 'trimal')
optdepends=('exonerate: for extract exon')
makedepends=('ldc')
source=(https://github.com/starsareintherose/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('2cfb59b37453d584c6d812b8bc0907a5e320c4997d33cf515a53d0a4b1d94a5a')
build() {
  cd "$_pkgname-$pkgver"
for dfile in splitfasta.d sortdiamond.d delstop.d deltaxa.d concataln.d countTaxa.d RGBEPP.d RGBEPP_refmix.d
do
  ldc -O2 --static $dfile
done
}


package(){
  cd "$_pkgname-$pkgver"
for bin in splitfasta sortdiamond delstop deltaxa concataln countTaxa RGBEPP RGBEPP_refmix sortdiamond
do
  install -Dm755 $bin $pkgdir/usr/bin/$bin
done
}
