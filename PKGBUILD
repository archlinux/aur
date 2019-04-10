# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Jaroslav Lichtblau <dragonlord at aur dot archlinux dot org>
# Contributor: Andrzej Giniewicz <gginiu at gmail dot com>

pkgbase=python2-scikit-image
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
pkgver=0.14.2
pkgrel=1
pkgdesc="Image processing routines for SciPy"
arch=('i686' 'x86_64')
url="http://scikit-image.org/"
license=('BSD')
makedepends=('cython2' 'python2-six')
depends=('python2-scipy' 'python2-matplotlib' 'python2-networkx' 'python2-pillow' 'python2-pywavelets')
optdepends=('python2-pyqt4: for imshow(x, fancy=True) and skivi'
            'freeimage: for reading various types of image file formats')
options=('!emptydirs')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('1afd0b84eefd77afd1071c5c1c402553d67be2d7db8950b32d6f773f25850c1f')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
        -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
        -i $(find . -name '*.py')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py build
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    mv ${pkgdir}/usr/bin/skivi{,2}
}
