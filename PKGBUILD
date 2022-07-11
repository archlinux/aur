# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-github-role
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.1.0
pkgrel=1
pkgdesc="A github role for Sphinx"
arch=('any')
url="https://sphinx-github-role.readthedocs.io"
license=('BSD')
makedepends=('python-flit-core'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx')
checkdepends=('python-nose' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/astrojuanlu/sphinx-github-role/main/LICENSE")
md5sums=('7449e06b9c00bcf9c2d76e571bff1217'
         'SKIP')

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
    nosetests #|| warning "Tests failed"
}

package_python-sphinx-github-role() {
    depends=('python-sphinx')
#   optdepends=('python-sphinx-github-role-doc: Documentation sphinx-github-role')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-sphinx-github-role-doc() {
#    pkgdesc="Documentation for sphinx-github-role"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
