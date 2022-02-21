# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bcftools
pkgver=1.15
pkgrel=1
pkgdesc='A program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF'
arch=('x86_64')
url='https://samtools.github.io/bcftools'
license=('GPL')
depends=('gsl' 'htslib' 'python-matplotlib' 'python')
source=("https://github.com/samtools/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1885ccb450a86e97a00aa905d7381ca9e07bd8967c05705a61d0007d2e22296e')

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
