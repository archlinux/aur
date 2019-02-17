# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=soupsieve
pkgname=python-${_pyname}-doc
pkgver=1.7.3
pkgrel=1
pkgdesc="Documentation for SoupSieve"
arch=('i686' 'x86_64')
url="https://facelessuser.github.io/soupsieve/"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'mkdocs-material')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'build_with_link.patch')
md5sums=('586675875ebfb1c4ad8627c72ea56006'
         '07432bf923bbeaad8fb45ba9a7442757')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/build_with_link.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdocs build
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
