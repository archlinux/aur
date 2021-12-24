# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.tools
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=4.0.1
pkgrel=1
pkgdesc="Collection of STScI utility functions"
arch=('any')
url="https://stscitools.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-doctestplus' 'python-astropy' 'tk')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b52ba367ec393e9b7914bee7ddd6d7a7')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package_python-stsci.tools() {
    depends=('python-astropy>=2' 'python-packaging')
    optdepends=('python-stsci.tools-doc: Documentation for STScI Tools')
    provides=("python-stscitools=${pkgver}")
    conflicts=('python-stscitools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
