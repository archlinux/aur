# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jupyter_sphinx
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.2
pkgrel=1
pkgdesc="Sphinx extension for rendering of Jupyter interactive widgets"
arch=('any')
url="https://jupyter-sphinx.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools')
#'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-sphinx' 'jupyter-nbconvert')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e7ab370d9793be5b20bce5447ccbd45b')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test || warning "Tests failed"
#   pytest #|| warning "Tests failed"
}

package_python-jupyter_sphinx() {
    depends=('python-sphinx>2' 'python-ipywidgets' 'jupyter-nbconvert>=5.5')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-jupyter_sphinx-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
