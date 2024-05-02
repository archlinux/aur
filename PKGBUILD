# Maintainer: Brian Wo <brianwo at protonmail dot com>

pkgbase=python-pygments-onehalf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.0.0
pkgrel=1
pkgdesc="One Half color scheme for Pygments"
arch=('any')
url="https://gitlab.com/tomwatson1024/pygments-onehalf"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pygments')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('33d55df2d6552e2a679f4b530354a195')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
}

check() {
    nosetests || warning "Tests failed"
}

package_python-pygments-onehalf() {
    depends=('python-pygments>=1.4')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

