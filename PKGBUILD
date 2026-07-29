# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.48.6
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL-3.0-only')
depends=('boost-libs')
options=('!debug')
makedepends=('boost' 'hdf5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8a5ff6b02206e85ca1172d112e3ea7bb0a4db70e6946e779441167a867f75352')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i '13 i \#include <memory>' source/writer.h
  sed -i '108s/$/ source\//' Makefile
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
