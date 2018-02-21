# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.7
pkgrel=1
pkgdesc="A program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib' 'python-matplotlib' 'python')
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('dd4f63d91b0dffb0f0ce88ac75c2387251930c8063f7799611265083f8d302d1')

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
