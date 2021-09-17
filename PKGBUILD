# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-extinction
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.4.6
pkgrel=1
pkgdesc="Fast interstellar dust extinction laws in Python"
arch=('i686' 'x86_64')
url="http://extinction.readthedocs.io"
license=('MIT')
makedepends=('cython' 'python-setuptools' 'python-numpy')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('8e0e541055cbf8f0794dbb2050d0958f')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-extinction() {
    depends=('python-numpy>=1.13.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
