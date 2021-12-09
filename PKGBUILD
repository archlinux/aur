# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-poliastro
_pyname=${pkgname#python-}
pkgver=0.16.0
pkgrel=1
pkgdesc="Astrodynamics and Orbital Mechanics computations"
arch=('any')
url="http://docs.poliastro.space"
license=('MIT')
makedepends=('python-setuptools' 'python-dephell')
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
md5sums=('37e9d40c6190e8ca765c57adb727d176')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   PYTHONPATH="build/lib" pytest || warning "Tests failed"
#    python setup.py test
#}

package() {
    depends=('python-scipy' 'python-astropy' 'python-jplephem' 'python-matplotlib>3.0.1' 'python-plotly' 'python-numba>=0.53.0')
    #'python-retrying')
    optdepends=('python-poliastro-doc: Documentation for poliastro'
#               'python-numba: For accelerating the code'
                'python-pandas'
                'python-astroquery>=0.3.9'
                'python-pytest: For running the tests from the package')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
