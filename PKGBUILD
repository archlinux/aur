# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jupyter-cache
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.4.3
pkgrel=1
pkgdesc="A defined interface for working with a cache of jupyter notebooks"
arch=('i686' 'x86_64')
url="https://jupyter-cache.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('jupyter-notebook'
              'python-requests'
              'python-nbdime'
              'jupyter-nbclient'
              'python-sqlalchemy'
              'python-jinja'
              'python-click-completion'
              'python-click-log')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('fac82fe60e0d3a5366e31c7f82fc96e6')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   pytest #|| warning "Tests failed"
}

package_python-jupyter-cache() {
    depends=('python-nbdime' 'jupyter-nbclient' 'python-sqlalchemy') # nbdime -> nbformat -> attrs
    optdepends=('python-click-completion: cli'
                'python-click-log: cli'
                'python-tabulate: cli'
                'python-yaml: cli'
                'flake8: code_style'
                'python-black: code_style'
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
