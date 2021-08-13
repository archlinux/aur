# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-stsci.tools
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
pkgver=3.6.0
pkgrel=3
pkgdesc="Collection of STScI utility functions"
arch=('i686' 'x86_64')
url="https://stscitools.readthedocs.io"
license=('BSD')
makedepends=('python2-setuptools-scm' 'python2-relic' 'python2-pytest-runner')
#checkdepends=('python-pytest-doctestplus' 'python-astropy' 'tk')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6c3db13921475d8a17c57c75263501a0')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py build
}

package_python2-stsci.tools() {
    depends=('python2-astropy')
    optdepends=('python-stsci.tools-doc: Documentation for STScI Tools')
    provides=("python2-stscitools=${pkgver}")
    conflicts=('python2-stscitools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    mv ${pkgdir}/usr/bin/convertlog{,2}
    mv ${pkgdir}/usr/bin/convertwaiveredfits{,2}
}
