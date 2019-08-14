# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='emv-cap'
pkgver="1.5"
pkgrel=1
pkgdesc='EMV CAP implementation in python'
url='https://sites.uclouvain.be/EMV-CAP/Application/'
license=('CC-BY-ND-2.0')

source=(
 'https://sites.uclouvain.be/EMV-CAP/resources/Data/EMVCAP-1.5.tar.gz'
)
sha512sums=(
 '7ab6752b0f883a0f22ab301231586cbf30485adfe36bcb62a733e25bd69f0443f15dff63b038460f71a14ce02adc71a410ba7689530eabb9441af6906cf18469'
)
arch=('any')
depends=(
 'python2'
 'python2-crypto'
 'python2-pyscard'
)
makedepends=(
 'python2-setuptools'
)

build() {
 cd "$srcdir"/EMVCAP-$pkgver
 python2 setup.py build
}

package() {
 cd "$srcdir"/EMVCAP-$pkgver
 python2 setup.py install --root="$pkgdir"/ --optimize=1
 sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
  $(find "${pkgdir}" -name '*.py')
}
