# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-dask-sphinx-theme
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
pkgver=3.0.3
pkgrel=1
pkgdesc="Sphinx theme for Dask documentation"
arch=('any')
url="https://github.com/dask/dask-sphinx-theme"
license=('BSD')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('559add7d000663d15107bac77ed7fe69')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python -m build --wheel --no-isolation
    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest
    nosetests
}

package_python-dask-sphinx-theme() {
    depends=('python-jsonschema' 'python-sphinx-book-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
#   python -m installer --destdir="${pkgdir}" dist/*.whl
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
