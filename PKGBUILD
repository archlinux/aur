# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-book-theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.1.10
pkgrel=1
pkgdesc="A lightweight book theme built off of the pydata sphinx theme"
arch=('any')
url="https://sphinx-book-theme.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-yaml' 'python-sphinx' 'python-pydata-sphinx-theme' 'python-beautifulsoup4')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b02e5b808c89ffff6c59b9b0e3ba11ad')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test || warning "Tests failed"
#   pytest #|| warning "Tests failed"
}

package_python-sphinx-book-theme() {
    depends=('python-yaml' 'python-sphinx' 'python-pydata-sphinx-theme' 'python-beautifulsoup4<5' 'python-importlib_resources')
    optdepends=('python-pre-commit: code_style'
                'python-folium: sphinx'
                'python-numpy: sphinx'
                'python-matplotlib: sphinx'
                'python-ipywidgets: sphinx'
                'python-pandas: sphinx'
                'python-ipywidgets: sphinx'
                'jupyter-nbclient: sphinx'
                'python-myst-nb: sphinx'
                'python-sphinx-togglebutton: sphinx'
                'python-sphinx-copybutton: sphinx'
                'python-plotly: sphinx'
                'python-sphinxcontrib-bibtex: sphinx'
                'python-sphinx-thebe: sphinx'
                'python-ablog: sphinx'
                'python-sphinxext-opengraph: sphinx'
                'python-sphinx-autobuild: live-dev'
                'python-web-compile: live-dev')
#               'python-sphinx-book-theme-doc: Documentation')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinx-book-theme-doc() {
#    pkgdesc="Documentation for Sphinx Book Theme"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
