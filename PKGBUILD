# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=APLpy
pkgname=python-aplpy-doc
pkgver=2.0.3
pkgrel=1
pkgdesc="Documentation for APLpy"
arch=('i686' 'x86_64')
url="http://aplpy.github.io/"
license=('MIT')
makedepends=("python-aplpy=${pkgver}" 'python-astropy-helpers>=3.1' 'python-sphinx-astropy' 'python-reproject')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e84db8f2447ea624a231e6bc4613dc22')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
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
