# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.8
pkgrel=1
pkgdesc="A program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF"
arch=('i686' 'x86_64')
url="http://samtools.github.io/bcftools/"
license=('GPL')
depends=('gsl' 'htslib' 'python-matplotlib' 'python')
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('4acbfd691f137742e0be63d09f516434f0faf617a5c60f466140e0677915fced')

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
