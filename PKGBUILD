# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-thebe
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.2.1
pkgrel=1
pkgdesc="Integrate interactive code blocks into your documentation with Thebe and Binder"
arch=('any')
url="https://sphinx-thebe.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
checkdepends=('python-nose' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('38b6df1fb77d7d67d48fdcb73004fa95')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests #|| warning "Tests failed"
}

package_python-sphinx-thebe() {
    depends=('python-sphinx>=4')
    optdepends=('python-matplotlib'
                'python-myst-nb: sphinx'
                'python-sphinx-book-theme>=0.4.0'
                'python-sphinx-copybutton'
                'python-sphinx_design')
#               'python-sphinx-thebe-doc: Documentation')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-thebe-doc() {
#    pkgdesc="Documentation for Sphinx-Thebe extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
