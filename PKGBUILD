# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
_pkgname=nemo-extensions
pkgver=3.2.0
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
depends=('nemo-python')
makedepends=('python2-distutils-extra')
options=('!libtool' '!emptydirs')
install="$pkgname".install

#source=("http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1536fd828b2ee0a8f194155a9e13b8cce937b403b5c87d8e579d7b1ced8d6d14')

prepare() {
#  cd ${srcdir}/${pkgname}
  cd ${srcdir}/${_pkgname}-${pkgver}/${pkgname}
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
            $(find . -name '*.py')
}

package() {
#  cd ${srcdir}/${pkgname}
  cd ${srcdir}/${_pkgname}-${pkgver}/${pkgname}
  python2 ./setup.py install --root="${pkgdir}"
}
