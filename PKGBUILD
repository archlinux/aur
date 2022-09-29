# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jplephem
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.18
pkgrel=1
pkgdesc="Use a JPL ephemeris to predict planet positions"
arch=('any')
url="https://github.com/brandon-rhodes/python-jplephem"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
checkdepends=('python-nose' 'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de405.bsp"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de421.bsp")
md5sums=('5207f11f286d8de28d9c9432302bd3fb'
         'SKIP'
         'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp ${srcdir}/*.bsp .
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests || warning "Tests failed"
}

package_python-jplephem() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
