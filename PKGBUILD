# Maintainer: Pavol Kapusta <pavol.kapusta at gmail dot com>

_pkgname='shisensho'
pkgname="python-${_pkgname}"
pkgver=0.9.12
pkgrel=1
pkgdesc='Shisen-Sho game'
arch=('any')
url='https://pypi.python.org/pypi/shisensho'
license=('ALv2')
depends=('python' 'tk' 'python-pillow')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz" "python-shisensho.patch" "pyshisensho")
sha256sums=('5957749c0342976b2465329e01820f537b4239d7885cd33ccef9fdd19639105a'
            'c6d14c1b24cc431033a20c2fca1139647fcd920900500184b71670a86f2b271b'
            '182448dc0e688589f1176fe4444a551df79519382832c0153a1e3a41b9c75f8b')


prepare() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   patch -p3 -i "$srcdir/python-shisensho.patch"
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py check
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}"
    mkdir "$pkgdir/usr/bin"
    cp -p "$srcdir/pyshisensho" "$pkgdir/usr/bin/"
}
