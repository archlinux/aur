# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-asdf-standard
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="Standards document describing ASDF, Advanced Scientific Data Format"
arch=('any')
url="https://asdf-standard.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx-asdf'
#            'graphviz')
#checkdepends=('python-pytest'
#              'python-asdf')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ccdd9e09c94f12fddd78914faecad727')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" -vv -l -ra --color=yes -o console_output_style=count
#}

package_python-asdf-standard() {
    depends=('python>=3.8')
    optdepends=('python-sphinx-asdf: For doc building (circular dep avoided)'
                'graphviz: For doc building')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-asdf-standard-doc() {
#    pkgdesc="Documentation for ASDF Standard"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
