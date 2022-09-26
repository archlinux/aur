# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jupyter_sphinx
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.4.0
pkgrel=1
pkgdesc="Sphinx extension for rendering of Jupyter interactive widgets"
arch=('any')
url="https://jupyter-sphinx.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools')
#'python-wheel' 'python-build' 'python-installer')
#checkdepends=('python-sphinx' 'jupyter-nbconvert' 'jupyterlab-widgets' 'jupyter-widgetsnbextension')
checkdepends=('python-nose' 'python-sphinx' 'python-ipywidgets' 'jupyter-nbconvert')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('130daa6be810976c9f8e30aa04011e50')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test || warning "Tests failed"
#   pytest #|| warning "Tests failed"
    nosetests
}

package_python-jupyter_sphinx() {
    depends=('python-sphinx>=2' 'python-ipywidgets>=7.0.0' 'jupyter-nbconvert>=5.5')    #nbformat depend by nbconvert
    provides=("python-jupyter-sphinx")
    conflicts=("python-jupyter-sphinx")
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
