# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-examples
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.0.5
pkgrel=1
pkgdesc="A lightweight example directive to make it easy to demonstrate code / results"
arch=('any')
url="https://ebp-sphinx-examples.readthedocs.io"
license=('MIT')
makedepends=('python-flit-core'
             'python-build'
             'python-installer')
#            'python-sphinx')
checkdepends=('python-nose' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9448f3367f514d1cdf73cb89791fc320')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests #|| warning "Tests failed"
}

package_python-sphinx-examples() {
    depends=('python-sphinx>4' 'python-sphinx_design')
    optdepends=('python-sphinx-book-theme: sphinx'
                'python-sphinx-copybutton: sphinx'
                'python-myst-parser: sphinx'
                'python-sphinx_rtd_theme: sphinx')
#               'python-sphinx--examples-doc: Documentation for sphinx-examples')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-examples-doc() {
#    pkgdesc="Documentation for sphinx-examples"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
