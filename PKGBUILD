# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.45.1
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5e568f03cabb35adc53b053ee62ef8c4b3198b33bf6933144b9568aba38af6ff')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i '87d' source/mothur.h
  sed -i 's/skipUchime),/skipUchime), source\/,/g' Makefile
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
