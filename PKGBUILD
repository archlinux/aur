# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stwcs
pkgname=python-${_pyname}-doc
pkgver=1.5.3
pkgrel=1
pkgdesc="Documentation for STWCS"
arch=('i686' 'x86_64')
url="https://stwcs.readthedocs.io/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme' 'texlive-latexextra')
#source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_stwcs_gui.patch')
md5sums=('e91a222f9ef29608c346220d712938cf'
         '4762dbab6658c1e4191101225d571f76')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_stwcs_gui.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
