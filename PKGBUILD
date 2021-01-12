# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=crds
pkgname=python-${_pyname}-doc
pkgver=10.3.5
pkgrel=1
pkgdesc="Documentation for STScI CRDS"
arch=('i686' 'x86_64')
url="https://hst-crds.stsci.edu/static/users_guide/index.html"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx-astropy' 'python-sphinx_rtd_theme' 'python-stsci_rtd_theme')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz"
        'fix_doc_warning.patch')
md5sums=('f868e15ad2fa4702ee236a0756e94ba6'
         '647db347dbb750a10b37c2e24090403f')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_doc_warning.patch"
}

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
