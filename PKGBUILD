# Maintainer: Decrypted Epsilon <decrypted.epsilon at gmail dot com>

pkgname=python2-deeptools
pkgver=2.4.1
pkgrel=1
pkgdesc="user-friendly tools for the normalization and visualization of deep-sequencing data"
arch=('any')
url="https://github.com/fidelram/deepTools"
license=('GPL3')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'python2-pysam' 'python2-bxpython')
source=(https://github.com/fidelram/deepTools/archive/$pkgver.tar.gz)
sha256sums=('0ca24961a6c99c584f7169f4047acfb5b87bdb22c322e376a6909cdab9c05181')

prepare() {
    cd "$srcdir/deepTools-${pkgver}/bin"
    sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
        -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
        -i $(find . -type f)
}

build() {
    msg "Building deepTools python2"
    cd "$srcdir/deepTools-${pkgver}"
    python2 setup.py build_ext --inplace
    python2 setup.py build
}


package() {
    depends=()
    cd ${srcdir}/deepTools-${pkgver}

    python2 setup.py install --root=${pkgdir}    
}
