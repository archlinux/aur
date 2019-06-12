# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=pyregion
pkgname=python-${_pyname}-doc
pkgver=2.0
pkgrel=1
pkgdesc="Documentation for Python pyregion module"
arch=('i686' 'x86_64')
url="http://pyregion.readthedocs.io/"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-astropy' 'python-astropy-helpers31' 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c228b133a1573d2017e0857a9fbf23c5')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
