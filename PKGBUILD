# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-nictools
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.1.5
pkgrel=1
pkgdesc="Python Tools for NICMOS Data"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/nictools"
license=('BSD')
makedepends=('python-setuptools' 'python-astropy' 'python-numpydoc' 'python-stsci.tools' 'python-stsci.imagestats')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f20b250268ba8fc7a50d9934a269e5dc')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-nictools() {
    depends=('python>=3.5' 'python-numpy>=1.9' 'python-scipy>=0.16' 'python-astropy>=1.0' 'python-stsci.tools' 'python-stsci.imagestats')
    optdepends=('python-nictools-doc: Documentation for Python NICMOS Tools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-nictools-doc() {
    pkgdesc="Documentation for Python NICMOS Tools"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
