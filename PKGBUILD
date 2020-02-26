# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-tweakwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.6.0
pkgrel=1
pkgdesc="A package for correcting alignment errors in WCS objects"
arch=('i686' 'x86_64')
url="https://tweakwcs.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-relic')
checkdepends=('python-pytest-cov' 'python-codecov' 'python-gwcs' 'python-spherical_geometry' 'python-stsci.imagestats' 'python-stsci.stimage' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/spacetelescope/tweakwcs/master/LICENSE.txt')
md5sums=('5976239428a5a3f76464b74b0148a154'
         'ca8dea23b938590a38eb415a5e448511')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    pytest
}

package_python-tweakwcs() {
    depends=('python>=3.5' 'python-astropy>=3.1' 'python-gwcs' 'python-spherical_geometry' 'python-stsci.imagestats' 'python-stsci.stimage')
    optdepends=('python-tweakwcs-doc: Documentation for tweakwcs')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
