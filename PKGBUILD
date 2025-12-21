# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinxemoji
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.2
pkgrel=1
pkgdesc="An extension to use emoji codes in your Sphinx documentation"
arch=('any')
url="https://sphinxemojicodes.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#'python-sphinx')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a9e4cc83505e09be25c8e26b460e18de')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest -vv -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -ra --color=yes -o console_output_style=count #
    nosetests -v -x || warning "Tests failed"
}

package_python-sphinxemoji() {
    depends=('python-sphinx>=5.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinxemoji-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
