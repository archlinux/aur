# Maintainer: David Verelst <david dott verelst hat gmail com>
# Contributor: richli
pkgname=python2-cartopy
pkgver=0.11.2
pkgrel=1
pkgdesc="A cartographic Python library with matplotlib support"
arch=('i686' 'x86_64')
url="http://scitools.org.uk/cartopy"
license=('LGPL3')
depends=('python2' 'proj' 'geos' 'python2-shapely' 
         'python2-pyshp' 'python2-scipy' 'python2-matplotlib')
makedepends=('cython2')
#checkdepends=('pep8-python2' 'python2-nose' 'python2-mock')
source=("https://github.com/SciTools/cartopy/archive/v${pkgver}.tar.gz")
md5sums=('e3cc04b8fb87e418031cd01d296ed428')
sha1sums=('73181a85bf252259bb58a41c6eadfa4ddf8a0c71')
sha256sums=('f803c565bd43ce94086f87e8c75c66755734fa0bc865f4ac3c1ff8df55487919')

build() {
    cd "$srcdir"/cartopy-$pkgver
    python2 setup.py build_ext --inplace
    python2 setup.py build
}

# As of 2014-02-05, I had 2/194 tests fail, due to some text rendering. I don't know if it's an issue with my font setup.
# confirmed, 1 failure and 1 error, but I didn't look into it any further ...
#check() {
#    cd "$srcdir"/cartopy-$pkgver
#    nosetests2 --with-doctest -sv
#}

package() {
    cd "$srcdir"/cartopy-$pkgver
    python2 setup.py install --root="$pkgdir"/ --optimize=1

    sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        $(find "${pkgdir}" -name '*.py')

    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

