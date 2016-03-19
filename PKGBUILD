# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=2.8.1
_mintrel=rosa
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
sha256sums=('135ab0036a272c5ec323a37b1763caca8d3c453fa45da8914659e18eca94eae2')

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
