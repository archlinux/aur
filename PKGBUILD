# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
pkgname=python-sbpy-doc
_pyname=sbpy
pkgver=0.2
pkgrel=1
pkgdesc="Documentation for Python sbpy module"
arch=('i686' 'x86_64')
url="http://sbpy.readthedocs.io/"
license=('BSD')
makedepends=('python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6421c7c58dc473974d1aaf11441a6032')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build_docs
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
