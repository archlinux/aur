# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-togglebutton
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pyname}-doc")
pkgver=0.4.4
pkgrel=1
pkgdesc="Toggle page content and collapse admonitions in Sphinx"
arch=('any')
url="https://sphinx-togglebutton.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
#checkdepends=('python-sphinx' 'python-wheel')
checkdepends=('python-nose' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('86fe9ac8d8ff13b9a5dfdc6b5a58630f')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
#   pytest #|| warning "Tests failed"
    nosetests
}

package_python-sphinx-togglebutton() {
    depends=('python-sphinx' 'python-setuptools' 'python-wheel')
    optdepends=('python-sphinx-book-theme: sphinx'
                'python-sphinx-examples: sphinx'
                'python-myst-nb: sphinx'
                'python-sphinx_design: sphinx'
                'python-numpy: sphinx'
                'python-matplotlib: sphinx')
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
