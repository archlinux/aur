# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=emcee
pkgname=python-${_pyname}-doc
pkgver=3.0.0
pkgrel=1
pkgdesc="Documentation for Python emcee"
arch=('i686' 'x86_64')
url="http://emcee.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme')
source=("https://github.com/dfm/emcee/archive/v${pkgver}.tar.gz"
        'fix_MPI_python_highlight.patch')
md5sums=('a6f411904868f8d4356a6b3215294f8b'
         '04636e60d509170af5e537588de57a0c')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_MPI_python_highlight.patch"
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
