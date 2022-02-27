# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-poliastro
_pyname=${pkgname#python-}
pkgver=0.16.2
pkgrel=1
pkgdesc="Astrodynamics and Orbital Mechanics computations"
arch=('any')
url="http://docs.poliastro.space"
license=('MIT')
makedepends=('python-flit-core' 'python-wheel' 'python-build' 'python-installer' 'python-oldest-supported-numpy')
#checkdepends=('python-pytest'
#              'python-wheel'
#              'python-hypothesis'
#              'python-pandas'
#              'jupyter-nbformat'
#              'python-matplotlib'
#              'python-retrying'
#              'python-pyrsistent'
#              'python-astroquery'
#              'python-plotly'
#              'python-jplephem'
#              'python-numba')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c7c32e6bad2b913f66a2a50491a72704')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   PYTHONPATH="build/lib" pytest || warning "Tests failed"
#    python setup.py test
#}

package() {
    depends=('python-scipy>=1.4.0' 'python-astroquery>=0.3.9"' 'python-jplephem' 'python-matplotlib>3.0.1' 'python-plotly<6' 'python-numba>=0.53.0' 'python-pyerfa' 'python-pandas')
    optdepends=('python-poliastro-doc: Documentation for poliastro'
#               'python-numba: For accelerating the code'
                'python-pytest: For running the tests from the package')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
