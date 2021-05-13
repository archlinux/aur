# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.45.3
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('865317569260ab7fa8fde2cbe00bcc05e6402dcd97267615d863ede145f381e8')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i '87d' source/mothur.h
  sed -i 's/skipUchime),/skipUchime), source\/,/g' Makefile
  sed -i 's/1.45.2/1.45.3/g' Makefile Makefile_cluster
#  rm splitkmerdist.cpp splitkmerdist.hpp
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
  install -Dm755 uchime "${pkgdir}/usr/bin/uchime"
}
