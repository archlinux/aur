# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=crds
pkgname=python-${_pyname}-doc
pkgver=11.16.8
pkgrel=1
pkgdesc="Documentation for STScI CRDS"
arch=('any')
url="https://hst-crds.stsci.edu/static/users_guide/index.html"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx-astropy' 'python-sphinx_rtd_theme' 'python-stsci_rtd_theme' 'python-asdf')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('a522732a12ab35ab0d383ad8a306b4f5')

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
