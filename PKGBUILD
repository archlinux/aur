# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname=python2-pyscard
pkgver=1.9.5
pkgrel=1
pkgdesc="Smartcard module for Python."
arch=('i686' 'x86_64')
url="http://www.gemalto.com/"
license=('LGPL2+')
depends=('python2')
source=("pyscard-${pkgver}.tar.gz::http://sourceforge.net/projects/pyscard/files/pyscard/pyscard%20${pkgver}/pyscard-${pkgver}.tar.gz/download")
sha512sums=('a0c5cd4ccbe8437ffd37afcf95c71f7d1d6c3ae364063cf81907095625d2062da8e7335ebfd15d1f952e8a8d9395e990b351b1308ab07fa456a7ee10658db4f9')

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

