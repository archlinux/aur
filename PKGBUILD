# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname=python2-pyscard
pkgver=1.9.7
pkgrel=2
pkgdesc="Smartcard module for Python."
arch=('i686' 'x86_64')
url="http://www.gemalto.com/"
license=('LGPL2+')
depends=('python2' 'pcsclite')
makedepends=('swig' 'python2-setuptools')
source=("pyscard-${pkgver}.tar.gz::http://sourceforge.net/projects/pyscard/files/pyscard/pyscard%20${pkgver}/pyscard-${pkgver}.tar.gz/download")
sha512sums=('339d6efd5fcaa361e30029e736d4e2e98e05acd701c39574b40960b4bcec4782ca9c1d6927cea0b3641c5e6a137d0b9fbd961b58422a4151cfbdfa067dcd4b4a')

build() {
    cd "$srcdir"/pyscard-$pkgver
    python2 setup.py build_ext --inplace
    python2 setup.py build
}

package() {
    cd "$srcdir"/pyscard-$pkgver
    python2 setup.py install --root="$pkgdir"/ --optimize=1

    sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        $(find "${pkgdir}" -name '*.py')

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

