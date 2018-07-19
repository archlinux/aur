# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.9
pkgrel=1
pkgdesc="A program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF"
arch=('x86_64')
url='http://samtools.github.io/bcftools'
license=('GPL')
depends=('gsl' 'htslib' 'python-matplotlib' 'python')
source=(https://github.com/samtools/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('6f36d0e6f16ec4acf88649fb1565d443acf0ba40f25a9afd87f14d14d13070c8')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-libgsl \
    --with-bcf-plugin-dir=/usr/lib/${pkgname} \
    --with-cblas=gslcblas \
    --with-htslib=system

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
