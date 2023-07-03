# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-galpy-doc
pkgver=1.9.0
pkgrel=1
pkgdesc="Documentation for galpy"
arch=('any')
url="https://www.galpy.org"
license=('BSD')
makedepends=("python-galpy=${pkgver}"
             'python-sphinxext-opengraph'
             'python-sphinx_design'
             'gsl'
             'ttf-roboto')
source=("https://github.com/jobovy/galpy/archive/v${pkgver}.tar.gz"
        'fix-underline-length.patch')
md5sums=('f67d67671baecd382933eda12c99709e'
         '1a85988bda24898d42f66da60075b3ac')

prepare() {
    cd ${srcdir}/galpy-${pkgver}

    patch -Np1 -i "${srcdir}/fix-underline-length.patch"
}

build() {
    cd ${srcdir}/galpy-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/galpy-docs

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../galpy-${pkgver}/LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/python-galpy/html"
    cp -a * "${pkgdir}/usr/share/doc/python-galpy/html"
}
