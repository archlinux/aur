# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=healpy
pkgname=python-${_pyname}-doc
pkgver=1.12.9
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc')
source=("https://github.com/healpy/healpy/archive/${pkgver}.tar.gz"
        'fix_underline_warning.patch')
md5sums=('2966c57f48c637611fe407fafa66f3b8'
         'd1fd09c9686b5eebdfbf06cd902e8575')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_underline_warning.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/.build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
