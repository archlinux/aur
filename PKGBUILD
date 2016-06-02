# Maintainer: Decrypted Epsilon <decrypted.epsilon at gmail dot com>

pkgname=python2-bxpython
pkgver=0.7.3
pkgrel=1
pkgdesc="Tools for manipulating biological data, particularly multiple sequence alignments"
arch=('any')
url="https://pypi.python.org/pypi/bx-python"
license=('GPL3')
depends=('python2' 'python2-numpy')
makedepends=('python2-nose')
source=(https://pypi.python.org/packages/source/b/bx-python/bx-python-$pkgver.tar.gz)
sha256sums=('518895e2dca313d7634c5cf48190b4020a463d6aa6adb42a261630bbd7e0e297')

prepare() {
    cd "$srcdir/bx-python-${pkgver}/scripts"
    sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
        -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
        -i $(find . -name '*.py')
}

build() {
    msg "Building bx-python python2"
    cd "$srcdir/bx-python-${pkgver}"
    python2 setup.py build_ext --inplace
    python2 setup.py build
}


package() {
    depends=()
    cd ${srcdir}/bx-python-${pkgver}

    python2 setup.py install --root=${pkgdir}    
}