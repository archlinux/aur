# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.14
pkgrel=1
pkgdesc='A program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF'
arch=('x86_64')
url='https://samtools.github.io/bcftools'
license=('GPL')
depends=('gsl' 'htslib' 'python-matplotlib' 'python')
source=("https://github.com/samtools/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b7ef88ae89fcb55658c5bea2e8cb8e756b055e13860036d6be13756782aa19cb')

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
