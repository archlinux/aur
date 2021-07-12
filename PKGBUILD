# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-hoverxref
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.7b1
pkgrel=1
pkgdesc="Sphinx extension to embed content in a tooltip on xref hover"
arch=('any')
url="https://sphinx-hoverxref.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/readthedocs/sphinx-hoverxref/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('2ff5b21cb6353e28f8932afc5bed066c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    pytest || warning "Tests failed"
}

package_python-sphinx-hoverxref() {
    depends=('python')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
