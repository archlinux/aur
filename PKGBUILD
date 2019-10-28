# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=emcee
pkgname=python-${_pyname}-doc
pkgver=3.0.1
pkgrel=1
pkgdesc="Documentation for Python emcee"
arch=('i686' 'x86_64')
url="http://emcee.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme' 'jupyter-nbconvert' 'pandoc')
source=("https://github.com/dfm/emcee/archive/v${pkgver}.tar.gz"
        'fix_MPI_python_highlight.patch')
md5sums=('68da24f0df9cbc43e4c3adfb9bb3f17f'
         '04636e60d509170af5e537588de57a0c')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   patch -Np1 -i "${srcdir}/fix_MPI_python_highlight.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE 
}
