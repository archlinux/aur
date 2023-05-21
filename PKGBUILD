# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-regli
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2022.722.0
pkgrel=2
pkgdesc="REgular Grid Linear Interpolator"
arch=('any')
url="https://github.com/hypergravity/regli"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-astroslam' 'python-laspec')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-for-numpy1.24.patch')
md5sums=('8ff5c5518d64aaa4d09d3ff517e679d8'
         '9a92308088c1527b548bbe0d9ca52401')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-for-numpy1.24.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    nosetests || warning "Tests failed"
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
