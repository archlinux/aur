# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jupyter-cache
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.5.0
pkgrel=1
pkgdesc="A defined interface for working with a cache of jupyter notebooks"
arch=('any')
url="https://jupyter-cache.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-tabulate'
               'python-click'
               'python-jupyter_client'
               'jupyter-nbclient'
               'jupyter-nbformat'
               'python-yaml'
               'python-sqlalchemy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('967f1e73243dbfe9e94aed413845e499')

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

package_python-jupyter-cache() {
    depends=('python-attrs' 'python-click' 'python-importlib-metadata' 'python-tabulate' 'python-yaml' 'jupyter-nbformat' 'jupyter-nbclient' 'python-sqlalchemy<1.5')
    optdepends=('python-click-log: cli'
                'python-jupytext: rtd'
                'python-myst-nb: rtd'
                'python-nbdime: rtd'
                'python-sphinx-book-theme: rtd'
                'python-sphinx-copybutton: rtd'
                'python-pre-commit: code_style')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-jupyter-cache-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
