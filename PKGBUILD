# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf_transform_schemas
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.3.0
pkgrel=1
pkgdesc="ASDF schemas for transforms"
arch=('any')
url="https://github.com/asdf-format/asdf-transform-schemas"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx-asdf'   # circular depends
#            'python-numpy'
#            'python-toml')
#checkdepends=('python-pytest' 'python-asdf')   # circular depends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ef999c5d7c1c321d5d4f8f1c9a27ac70')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname}*egg-info \
#       build/lib/${_pyname}-${pkgver}-py$(get_pyver).egg-info
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   PYTHONPATH="../build/lib" make html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="build/lib" pytest #|| warning "Tests failed"
#}

package_python-asdf_transform_schemas() {
    depends=('python>=3.8' 'python-asdf-standard>=1.0.1' 'python-importlib_resources>=3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
