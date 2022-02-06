# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-togglebutton
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.0
pkgrel=1
pkgdesc="Toggle page content and collapse admonitions in Sphinx"
arch=('any')
url="https://sphinx-togglebutton.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-sphinx' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('11839c55d8922591eb93c84c7490a312')

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

package_python-sphinx-togglebutton() {
    depends=('python-sphinx' 'python-setuptools' 'python-wheel')
    optdepends=('python-sphinx-book-theme: sphinx'
                'python-myst-nb: sphinx')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinx-togglebutton-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
