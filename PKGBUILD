# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=nestle
pkgname=python-${_pyname}-doc
pkgver=0.2.0
pkgrel=1
pkgdesc="Documentation for Nestle"
arch=('i686' 'x86_64')
url="http://kylebarbary.com/nestle/"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx-gallery' 'python-corner' 'python-scipy')
source=("https://github.com/kbarbary/nestle/archive/v${pkgver}.tar.gz"
        'correct_image_path.patch')
md5sums=('64edb99c551804d6847278a39d0ee183'
         'ad877ac724bb6f66415b7e66f055238d')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/correct_image_path.patch"
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
