# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-einsteinpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.1
pkgrel=1
pkgdesc="Python package for General Relativity"
arch=('i686' 'x86_64')
url="https://einsteinpy.org/"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-matplotlib' 'python-astropy' 'python-sympy' 'python-plotly')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('24f0ba1b00781fc3bd2cf8fa082e22ca')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-einsteinpy() {
    depends=('python>=3.5' 'python-astropy' 'python-matplotlib' 'python-plotly>=4.0' 'python-sympy>=1.1')
    optdepends=('python-numba: For accelerating the code'
                'python-einsteinpy-doc: Documentation for EinsteinPy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
