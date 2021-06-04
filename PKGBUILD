# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-panels
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.6.0
pkgrel=1
pkgdesc="A sphinx extension for creating panels in a grid layout"
arch=('any')
url="https://sphinx-panels.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f2e926a14ad27d66d59fc329339d496e')

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

package_python-sphinx-panels() {
    depends=('python-sphinx' 'python-importlib_resources')
    optdepends=('python-sphinx_rtd_theme: themes'
                'python-pydata-sphinx-theme: themes'
                'python-sphinx-book-theme: themes'
                'python-myst-parser: themes'
                'python-pre-commit: code_style'
                'python-sphinx-autobuild: live-dev'
                'python-web-compile: live-dev')
#               'python-sphinx-panels-doc: Documentation')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinx-panels-doc() {
#    pkgdesc="Documentation for Sphinx-Panels extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
