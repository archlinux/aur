# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-selective-exclude
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.0.3
pkgrel=1
pkgdesc="Sphinx eager \".. only::\" directive and other selective rendition extensions"
arch=('any')
url="https://github.com/pfalcon/sphinx_selective_exclude"
license=('BSD-2-Clause')
makedepends=('python-setuptools')
#            'python-build'
#            'python-installer')
#checkdepends=('python-pytest-import-check'
#              'python-sphinx'
#)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c17ba9ff85e5062a9e985b98b64b1b09')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -e "s:import sphinx:from sphinx.directives.other import Only:" \
        -e "/EagerOnly/s:sphinx.directives.other.::" -i ${_pyname}/eager_only.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="${srcdir}/${_pyname}-${pkgver}" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest build/lib --import-check -vv -l -ra --color=yes -o console_output_style=count
#}

package_python-sphinx-selective-exclude() {
    depends=('python')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-selective-exclude-doc() {
#    pkgdesc="Documentation for Python sphinx-selective-exclude"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
##   install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
