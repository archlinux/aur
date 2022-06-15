# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-py3doc-enhanced-theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.4.0
pkgrel=1
pkgdesc="Theme based on https://docs.python.org/3/ with some responsive enhancements"
arch=('any')
url="https://github.com/ionelmc/sphinx-py3doc-enhanced-theme"
license=('BSD')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#            'python-sphinx')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('38af7b770835cca10a6034abdcc58989')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/[pytest]/s/pytest/tool:pytest/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    EXTRASTYLING="true" pytest || warning "Tests failed"
}

package_python-sphinx-py3doc-enhanced-theme() {
    depends=('python')
#   optdepends=('python-sphinx-py3doc-enhanced-theme-doc: Documentation for sphinx-py3doc-enhanced-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-py3doc-enhanced-theme-doc() {
#    pkgdesc="Documentation for sphinx-py3doc-enhanced-theme"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
