# Maintainer: Astro Benzene <universebenzene at sina dot com>

_pyname=crds
pkgname=python-${_pyname}-doc
pkgver=13.0.6
pkgrel=1
pkgdesc="Documentation for STScI CRDS"
arch=('any')
url="https://hst-crds.stsci.edu/static/users_guide/index.html"
license=('BSD-3-Clause')
makedepends=("python-${_pyname}=${pkgver}"
             'python-setuptools'
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-sphinx-tabs')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('df3c0a3b309cf379db1037b56246141f')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/documentation/crds_users_guide

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/documentation/crds_users_guide/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
