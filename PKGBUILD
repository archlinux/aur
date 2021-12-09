# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-czml3
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.6.0
pkgrel=1
pkgdesc="Python 3 library to write CZML"
arch=('any')
url="https://github.com/poliastro/czml3"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'subversion' 'python-astropy' 'python-dateutil' 'python-w3lib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('cf69c76dc0fcdf480d42cb9dcc84623d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    svn export https://github.com/poliastro/czml3/trunk/tests || warning "Failed to fetch testing files"
    PYTHONPATH="build/lib" pytest || warning "Tests failed"
}

package_python-czml3() {
    depends=('python>=3.7' 'python-attrs>=19.2' 'python-dateutil<3' 'python-w3lib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
