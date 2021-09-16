# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.imagestats
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.6.3
pkgrel=1
pkgdesc="STScI clipped image statistics with core functionality of IRAF's imstatistics"
arch=('i686' 'x86_64')
url="https://stsciimagestats.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('dce4aa0c76f9e00184e0f8e40ba73954')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="build/lib.linux-${CARCH}-${_pyver}" python setup.py test
##   pytest
#}

package_python-stsci.imagestats() {
    depends=('python>=3.6' 'python-numpy>=1.14' 'python-stsci.tools')
    optdepends=('python-stsci.imagestats-doc: Documentation for STScI Imagestats')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
#   rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__init__.py"
#   rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__pycache__"/*
}
