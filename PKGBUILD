# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-thebe
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.1.1
pkgrel=1
pkgdesc="Integrate interactive code blocks into your documentation with Thebe and Binder"
arch=('any')
url="https://sphinx-thebe.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d9428fc80937123f7298cee2c6104e10')

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

package_python-sphinx-thebe() {
    depends=('python-sphinx>=3.6')
    optdepends=('python-myst-parser: sphinx'
                'python-sphinx-book-theme'
                'python-jupyter-sphinx'
                'python-sphinx-panels')
#               'python-sphinx-thebe-doc: Documentation')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinx-thebe-doc() {
#    pkgdesc="Documentation for Sphinx-Thebe extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
