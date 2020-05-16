# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.44.1
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'hdf5')
options=('!buildflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v.${pkgver}.tar.gz")
sha256sums=('0fd6e7a1affdadb782639db58b4d43b9194b78a1ddfb54f8901fbca215922bb5')

prepare() {
  cd "${pkgname}-v.${pkgver}"

  sed -i 's/skipUchime),/skipUchime), source\/,/' Makefile  
}

build() {
  cd "${pkgname}-v.${pkgver}"

  make
}

package() {
  cd "${pkgname}-v.${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
}
