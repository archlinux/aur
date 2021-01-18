# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-einsteinpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.3.1
pkgrel=1
pkgdesc="Python package for General Relativity"
arch=('i686' 'x86_64')
url="https://einsteinpy.org"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-matplotlib' 'python-astropy' 'python-scipy' 'python-sympy' 'python-plotly' 'python-numba')
#'python-numba>0.49.0')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('208d50ec364eecc49a7d7db5de3bf83a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    PYTHONPATH="build/lib" pytest
}

package_python-einsteinpy() {
    depends=('python>=3.7' 'python-astropy' 'python-matplotlib' 'python-plotly>=4.0' 'python-scipy>=1.0' 'python-sympy>=1.1' 'python-numba' 'python-einsteinpy_geodesics')
    #'python-numba>0.49.0')
    optdepends=('python-einsteinpy-doc: Documentation for EinsteinPy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
