# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sunpy-sphinx-theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.2.22
pkgrel=1
pkgdesc="The sphinx theme for the SunPy website and documentation"
arch=('i686' 'x86_64')
url="https://github.com/sunpy/sunpy-sphinx-theme"
license=('BSD')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-sphinx' 'python-sphinx-bootstrap-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e8371f408035d0acedabd7784997efea')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   pytest
}

package_python-sunpy-sphinx-theme() {
    depends=('python-sphinx' 'python-sphinx-bootstrap-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
