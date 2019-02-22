# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-poliastro
_pyname=${pkgname#python-}
pkgver=0.12.0
pkgrel=1
pkgdesc="Astrodynamics and Orbital Mechanics computations"
arch=('i686' 'x86_64')
url="http://docs.poliastro.space/"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest'
              'python-pandas'
              'jupyter-nbformat'
              'python-matplotlib'
              'python-retrying'
              'python-pyrsistent'
              'python-astroquery'
              'python-plotly'
              'python-jplephem'
              'python-numba')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('92ceb28714723ae63381d8a241b9aad9')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    depends=('python>=3.5' 'python-astropy' 'python-jplephem' 'python-matplotlib' 'python-plotly' 'python-retrying')
    optdepends=('python-numba: For accelerating the code'
                'python-poliastro-doc: Documentation for poliastro'
                'python-pandas'
                'python-astroquery'
                'python-pytest: For running the tests from the package')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
