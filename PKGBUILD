# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=3.0.0
_mintrel=betsy
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
sha256sums=('de1afcca1f15eaf8265bdb02c690556a128623b3b8892735d1f5e7316e01cdd0')

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
