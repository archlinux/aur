# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.45.0
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v.${pkgver}.tar.gz")
sha256sums=('b22e1b4ba8686f4e77e6a55a30a1a1cb6490b651398b0756d84f80314f55aa70')

prepare() {
  cd "${pkgname}-v.${pkgver}"

  sed -i '87d' source/mothur.h
  sed -i 's/skipUchime),/skipUchime), source\/,/g' Makefile
}

build() {
  cd "${pkgname}-v.${pkgver}"

  make
}

package() {
  cd "${pkgname}-v.${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
  install -Dm755 uchime "${pkgdir}/usr/bin/uchime"
}
