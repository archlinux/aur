# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=vcftools
pkgver=0.1.13
pkgrel=1
pkgdesc="A set of tools written in Perl and C++ for working with VCF files"
arch=('x86_64')
url="https://vcftools.github.io/"
license=('LGPL3')
depends=('perl' 'zlib')
source=(https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('45368c056b1c3a35c478e1300a5a7eca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make \
    PREFIX=${pkgdir}/usr \
    MANDIR=${pkgdir}/usr/share/man/man1 \
    MODDIR=${pkgdir}/usr/lib/perl15/vendor_perl \
    install

  install -D -m755 cpp/vcftools "${pkgdir}/usr/bin/vcftools"
}
