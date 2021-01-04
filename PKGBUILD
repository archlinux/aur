# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-tabs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.3.0
pkgrel=1
pkgdesc="Tabbed views for Sphinx"
arch=('i686' 'x86_64')
url="https://sphinx-tabs.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
#'python-sphinx')
checkdepends=('python-sphinx' 'python-pygments')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0bdb8e8577d3ec12f5e4aa48bb3cfe5a')

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

package_python-sphinx-tabs() {
    depends=('python-sphinx<4' 'python-pygments')
    optdepends=('python-pre-commit: code_style')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinx-tabs-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
