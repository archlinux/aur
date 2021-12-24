# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci_rtd_theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.0.2
pkgrel=1
pkgdesc="STScI Branded Sphinx theme"
arch=('any')
url="https://github.com/spacetelescope/stsci_rtd_theme/"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d04f43974914985dcc4312ba1cce6322')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-stsci_rtd_theme() {
    depends=('python-sphinx>=1.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
