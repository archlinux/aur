# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkautodoc
_pyname=${pkgbase}
pkgname=("${_pyname}")
pkgver=0.2.0
pkgrel=1
pkgdesc="Auto documentation for MkDocs"
arch=('any')
url="https://github.com/tomchristie/mkautodoc"
license=('BSD')
makedepends=('python-setuptools')
#            'python-build'
#            'python-installer')
checkdepends=('python-nose'
              'python-markdown')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('b6e0c89804ba39d453ce5795eb040e5615756f90438ac04f47e97893a86a10cd')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests || warning "Tests failed" # -v -x
}

package_mkautodoc() {
    depends=('python>=3.6' 'python-markdown')
    cd ${srcdir}/${_pyname}-${pkgver}

#   install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
