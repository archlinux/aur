# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jplephem
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=2.14
pkgrel=1
pkgdesc="Use a JPL ephemeris to predict planet positions"
arch=('i686' 'x86_64')
url="https://github.com/brandon-rhodes/python-jplephem"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0d8110950fcca5ee1f74e889bdedb277')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

package_python2-jplephem() {
    depends=('python2-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-jplephem() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
