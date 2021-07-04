# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=pyregion
pkgname=python-${_pyname}-doc
pkgver=2.1.1
pkgrel=1
pkgdesc="Documentation for Python pyregion module"
arch=('i686' 'x86_64')
url="http://pyregion.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-astropy' 'python-astropy-helpers31' 'python-sphinx-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bd46c4982eee451387df55432854407d')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i '/auto_use/s/True/False/' setup.cfg
    sed -i 's/package_name/name/' docs/conf.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
}
