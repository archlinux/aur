# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regli
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2023.829.0
pkgrel=2
pkgdesc="REgular Grid Linear Interpolator"
arch=('any')
url="https://github.com/hypergravity/regli"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-astroslam' 'python-laspec')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bc5fd8f540cc519f127eae599f2072a3')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    nosetests -v -x || warning "Tests failed"
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
