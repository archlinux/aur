# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinxcontrib-srclinks
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.2.4
pkgrel=1
pkgdesc="Add source, edit, history, annotate links to GitHub or BitBucket"
arch=('any')
url="https://github.com/westurner/sphinxcontrib-srclinks"
license=('BSD')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#checkdepends=('python-pytest')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7ff5e43219b1bc11cff3f38698152bc3')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests -v -x #|| warning "Tests failed"
#   pytest
}

package_python-sphinxcontrib-srclinks() {
    depends=('python-sphinx>=0.6')
#   optdepends=('python-sphinxcontrib-srclinks-doc: Documentation for sphinxcontrib-srclinks')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinxcontrib-srclinks-doc() {
#    pkgdesc="Documentation for Sphinx-hoverxref"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
