# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=stringtie
pkgver=1.3.6
pkgrel=1
pkgdesc="A fast and highly efficient assembler of RNA-Seq\
 alignments into potential transcripts."

url='https://ccb.jhu.edu/software/stringtie/index.shtml'
arch=('x86_64')

license=('Artistic2.0')

depends=('gcc-libs' 'zlib')

provides=('stringtie')
conflicts=('stringtie')

source=("https://ccb.jhu.edu/software/$pkgname/dl/$pkgname-$pkgver.tar.gz")
sha256sums=('9dbdf01ab3282dc6eb647409920b53f8e0df45f4c45faf9d6b5ca135a3738ee8')

build() {
  cd $srcdir/$pkgname-$pkgver/
  
  make release
}

check() {
  cd $srcdir/$pkgname-$pkgver/
  ./stringtie --version | grep -Fxq "$pkgver"
}

package() {
  cd $srcdir/$pkgname-$pkgver/

  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
  
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

