# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-hoverxref
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.1.1
pkgrel=1
pkgdesc="Sphinx extension to embed content in a tooltip on xref hover"
arch=('any')
url="https://sphinx-hoverxref.readthedocs.io"
license=('MIT')
makedepends=('python-flit-core'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx-prompt'
#            'python-sphinx-tabs'
#            'python-sphinx-autoapi'
#            'python-sphinx-version-warning'
#            'python-sphinx-notfound-page'
#            'python-sphinxcontrib-bibtex')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f719b64a5642f955fd65235cd3dec22c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py2.py3-none-any.whl -C dist/lib
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../dist/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    nosetests #|| warning "Tests failed"
}

package_python-sphinx-hoverxref() {
    depends=('python-sphinx>=1.8')
#   optdepends=('python-sphinx-hoverxref-doc: Documentation for sphinx-hoverxref')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-hoverxref-doc() {
#    pkgdesc="Documentation for Sphinx-hoverxref"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
