# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.image
pkgname=python-${_pyname}-doc
pkgver=2.3.3
pkgrel=1
pkgdesc="Documentation for STScI Image"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/stsci.image"
license=('BSD')
makedepends=("python2-${_pyname}=${pkgver}" 'python2-numpydoc' 'python2-stsci.sphinxext')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz"
        'fix_new_sphinx.patch')
md5sums=('3067df5c19b14573b17c080931acc93c'
         '561121bb3958143ce70f2f8ba1971747')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_new_sphinx.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make SPHINXBUILD=sphinx-build2 html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
