# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-myst-nb
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.13.2
pkgrel=1
pkgdesc="Parse and execute ipynb files in Sphinx"
arch=('any')
url="https://myst-nb.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
#'python-sphinx')
#checkdepends=('python-jupyter_sphinx' 'python-jupyter-cache' 'jupyter-nbconvert' 'python-yaml' 'python-sphinx-togglebutton' 'python-myst-parser')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('063ffdcb077f8fe6c3f4db45f3a0a669')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    #python setup.py test
#    pytest #|| warning "Tests failed"
#}

package_python-myst-nb() {
    depends=('python-importlib-metadata'
             'ipython'
             'python-ipywidgets<8'
             'python-jupyter-cache'
             'python-jupyter_sphinx'
             'python-myst-parser'
             'jupyter-nbconvert<7'
             'jupyter-nbformat'
             'python-yaml'
             'python-sphinx-togglebutton')
    optdepends=('python-pre-commit: code_style'
                'python-alabaster: rtd'
                'python-altair: rtd'
                'python-bokeh: rtd'
                'coconut-lang: rtd'
                'python-jupytext: rtd'
                'python-matplotlib: rtd'
                'python-numpy: rtd'
                'python-pandas: rtd'
                'python-plotly: rtd'
                'python-sphinx-book-theme: rtd'
                'python-sphinx-copybutton: rtd'
                'python-sphinx-panels: rtd'
                'python-sphinxcontrib-bibtex: rtd'
                'python-sympy: rtd')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-tabs-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
