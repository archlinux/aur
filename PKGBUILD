# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.6
pkgrel=1
pkgdesc="A program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib' 'python-matplotlib' 'python')
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('293010736b076cf684d2873928924fcc3d2c231a091084c2ac23a8045c7df982')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-libgsl \
    --with-bcf-plugin-dir=/usr/lib/$pkgname \
    --with-cblas=gslcblas \
    --with-htslib=system

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
