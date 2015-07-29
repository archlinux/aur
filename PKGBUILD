# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=2.6.0
_mintrel=rafaela
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
depends=('nemo-python')
makedepends=('python2-distutils-extra')
options=('!libtool' '!emptydirs')
install="$pkgname".install

source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('6ac2c5c433c437fef9cb0f55b100b12d1934f203e4b9373e208b38b578b52b64')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}+${_mintrel}
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
            $(find . -name '*.py')
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}+${_mintrel}
  python2 ./setup.py install --root="${pkgdir}"
}
