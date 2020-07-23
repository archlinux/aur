# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=healpy
pkgname=python-${_pyname}-doc
pkgver=1.14.0
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc' 'python-pillow')
source=("https://github.com/healpy/healpy/archive/${pkgver}.tar.gz"
        'fix_doc_warning.patch')
md5sums=('1d0aa0ee4599f7dc30933fedfafc713b'
         '685840f1c3333c81d00b9eea58aafc8e')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_doc_warning.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/.build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -m644 ../healpy_tutorial.ipynb "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
