# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-healpy
_pyname=${pkgname#python-}
pkgver=1.14.0
pkgrel=1
pkgdesc="Python package to manipulate healpix maps"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
depends=('python>=3.4' 'python-numpy>=1.13' 'python-matplotlib' 'python-astropy' 'cfitsio' 'healpix>=3.60' 'python-six')
makedepends=('cython>=0.16' 'python-pytest-runner')
optdepends=('python-healpy-doc: Documentation for healpy')
checkdepends=('python-pytest-cython' 'python-pytest-doctestplus' 'python-pillow' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz")
md5sums=('2e56fdad5fa3780f7381449a7b2672fb')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}/build/lib.linux-${CARCH}-${_pyver}

    pytest
}

package() {
    cd ${srcdir}/healpy-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
