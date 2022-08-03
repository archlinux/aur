# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-deprecat
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.1.1
pkgrel=1
pkgdesc="Python @deprecat decorator to deprecate old python classes, functions or methods"
arch=('any')
url="https://deprecat.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx')
#checkdepends=('python-pytest')
checkdepends=('python-nose' 'python-wrapt')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('81939d2b36a8e0db24f30eca0dbceb0a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest #|| warning "Tests failed" #\
    nosetests #|| warning "Tests failed" #\
}

package_python-deprecat() {
    depends=('python>=3.6' 'python-wrapt>=1.10')
    optdepends=('python-deprecat-doc: Documentation for deprecat')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-deprecat-doc() {
#    pkgdesc="Documentation for Python deprecat"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
