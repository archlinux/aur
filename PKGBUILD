# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=ginga
pkgname=python-${_pyname}-doc
pkgver=2.7.2
pkgrel=1
pkgdesc="Documentation for Ginga"
arch=('i686' 'x86_64')
url="https://ejeschke.github.io/ginga/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-astropy-helpers>=3.1' 'python-sphinx-astropy' 'python-sphinx_rtd_theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('8063b6400f1faf5f32e3769bd13a8563')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
