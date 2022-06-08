# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-version-warning
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.1.2
pkgrel=1
pkgdesc="Sphinx extension to add a warning banner"
arch=('any')
url="https://sphinx-version-warning.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#checkdepends=('python-pytest' 'python-munch')
#checkdepends=('python-nose' 'python-munch')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b17e016b32add34e5deaa80b4a9af799')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   python -m build --wheel --no-isolation
    python setup.py build

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   pytest #|| warning "Tests failed"
#    nosetests #|| warning "Tests failed"
#}

package_python-sphinx-version-warning() {
    depends=('python-sphinx')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
#   python -m installer --destdir="${pkgdir}" dist/*.whl
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinx-version-warning-doc() {
#    pkgdesc="Documentation for sphinx-versionwarning"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
