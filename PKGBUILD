# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-nestle
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=0.2.0
pkgrel=1
pkgdesc="Nested sampling algorithms for evaluating Bayesian evidence"
arch=('i686' 'x86_64')
url="http://kylebarbary.com/nestle/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('49e14a2fc989ced42db7f0c411162e00')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
}

check() {
    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-nestle() {
    depends=('python2-numpy>=1.6')
    optdepends=('python2-scipy'
                'python-nestle-doc: Documentation for Nestle')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-nestle() {
    depends=('python-numpy>=1.6')
    optdepends=('python-scipy'
                'python-nestle-doc: Documentation for Nestle')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
