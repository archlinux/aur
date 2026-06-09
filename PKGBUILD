# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='9.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='coremltools'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Community Tools for Core ML"
arch=('any')
url='https://github.com/apple/coremltools'
license=('BSD-3-Clause')

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-parameterized' 'python-pytorch' 'python-scipy' 'python-transformers' 'python-numpy' 'python-mock' 'python-cattrs' 'python-pytest' 'python-pandas' 'python-requests' 'python-attrs' 'python-scikit-learn' 'python-packaging' 'python-pillow' 'python-graphviz' 'python-protobuf' 'python-yaml' 'python-filelock' 'python-sympy' 'python-tabulate' 'python-tqdm' 'python-tensorflow' 'python-xgboost' 'python-torchao')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('4ff346b29c31c4b45acd19a20e0f0a1ac65180a96776e62f15bd5c46f4926687')


build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
