# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=fastdnaml
_pkg=fastDNAml
pkgver=1.2.2
pkgrel=0
arch=('x86_64')
pkgdesc="A tool for construction of phylogenetic trees of DNA sequences \
	 using maximum likelihood \
	 https://doi.org/10.1093/bioinformatics/10.1.41"
url='https://www.life.illinois.edu/gary/programs/fastDNAml.html'
license=('GPL-2.0-only')
depends=('glibc' 'bash')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tgz::https://www.life.illinois.edu/gary/programs/${_pkg}/${_pkg}_$pkgver.tar.gz")
sha1sums=('78197cbd760163f65085ac80c36d4286a1f29e34')

build() {
  cd $srcdir/${_pkg}_$pkgver/source
  make
}

package() {
  # binary
  cd $srcdir/${_pkg}_$pkgver/source
  install -Dm 755 $_pkg $pkgdir/usr/bin/$_pkg
  # scripts
  cd $srcdir/${_pkg}_$pkgver/scripts
  for sh in $(ls *)
do
  install -Dm 644 $sh $pkgdir/usr/share/$pkgname/$sh
done  
  # docs
  cd $srcdir/${_pkg}_$pkgver/docs
  for txt in $(ls *.txt)
do
  install -Dm 644 $txt $pkgdir/usr/share/doc/$pkgname/$txt
done  
}
