# Maintainer: iceychris <none>
pkgbase=python-libreasr
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.0.3
pkgrel=1
pkgdesc="LibreASR: An On-Premises, Streaming Speech Recognition System"
arch=('i686' 'x86_64')
url="https://github.com/iceychris/LibreASR"
license=('MIT')
makedepends=('make')
#'python-pandas' 'python-astropy' 'python-beautifulsoup4' 'python-sphinx-automodapi' 'python-sphinx_rtd_theme' 'python-matplotlib')
# checkdepends=('python-pytest-astropy-header'
#               'python-astropy'
#               'python-beautifulsoup4'
#               'python-requests'
#               'python-ci_watson'
#               'python-yaml'
#               'python-matplotlib')
# https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz
source=("https://github.com/iceychris/LibreASR/archive/dev.zip")
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    make tests
}

package() {
    depends=('python>=3.7')
    optdepends=('python-matplotlib'
                'python-scipy'
                'python-scikit-image'
                'python-stsci.imagestats'
                'python-acstools-doc: Documentation for Python ACS Tools')
    cd ${srcdir}/${_pyname}-${pkgver}

    # install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.md"
    # install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
