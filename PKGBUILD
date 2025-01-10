# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-documatt-theme
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.0.6
pkgrel=1
pkgdesc="Documatt Theme for Sphinx documentation projects"
arch=('any')
url="https://documatt.com/sphinx-themes/themes/documatt.html"
license=('MIT')
makedepends=('python-setuptools')
#            'python-build'
#            'python-installer'
#            'python-sphinx'
# wheel required by new setuptools
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c36625d6ea1e2f7f3522ee7ff9ce8df3')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
    nosetests -v -x || warning "Tests failed"
}

package_python-sphinx-documatt-theme() {
    depends=('python-sphinx')
    optdepends=('python-sphinx-documatt-theme-doc: Documentation for Documat Sphinx Theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-documatt-theme-doc() {
#    pkgdesc="Documentation for Python Documatt Sphinx Theme"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
