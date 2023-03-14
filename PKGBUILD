# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx_design
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.0
pkgrel=1
pkgdesc="A sphinx extension for designing beautiful, screen-size responsive web components"
arch=('any')
url="https://sphinx-design.readthedocs.io"
license=('MIT')
makedepends=('python-flit-core'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('8283e2917f9bf3b1ab5688deb6a1aaa5')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest #|| warning "Tests failed"
    nosetests || warning "Tests failed"
}

package_python-sphinx_design() {
    depends=('python-sphinx')
    optdepends=('python-pre-commit: code_style'
                'python-myst-parser: rtd'
                'python-sphinx_design-doc: Documentation for sphinx_design')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx_design-doc() {
#    pkgdesc="Documentation for sphinx_design"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
