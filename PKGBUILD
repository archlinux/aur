# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python2-sphinx-automodapi
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
pkgver=0.12
pkgrel=1
pkgdesc="Sphinx extension for generating API documentation."
arch=('any')
url="https://sphinx-automodapi.readthedocs.io"
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('a1338bc0a7f5c9bb317ecf7c7abd489c7cff452098205ef5110f733570516ac0')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py test
}

package_python2-sphinx-automodapi() {
    depends=('python2-sphinx>=1.7')
    optdepends=('python-sphinx-automodapi-doc: Documentation for sphinx-automodapi')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
