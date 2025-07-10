# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Contributor: dreieck <oid-maps@seznam.cz>

pkgname=vcftools
pkgver=0.1.17
pkgrel=1
pkgdesc="A set of tools written in Perl and C++ for working with VCF files"
arch=('x86_64')
url="https://vcftools.github.io/"
license=('LGPL-3.0-or-later')
depends=('perl' 'zlib')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('00b54fc7349179c2efbdab0e4dcb65a69e7b0ab0d0d29b59cc823140d0b40bff')

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
