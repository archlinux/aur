# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=vcftools
pkgver=0.1.16
pkgrel=1
pkgdesc="A set of tools written in Perl and C++ for working with VCF files"
arch=('x86_64')
url="https://vcftools.github.io/"
license=('LGPL3')
depends=('perl' 'zlib')
source=(https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('575c13073efe65cbff6e2ab99eef12fe04536f5dc1f98de6674c848ca83cf302')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=${pkgdir}/usr --mandir=${pkgdir}/usr/share/man/man1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install

  install -D -m755 src/cpp/vcftools "${pkgdir}/usr/bin/vcftools"
}
