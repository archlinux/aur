# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=hyppo
pkgname=python-hyppo
pkgver=0.5.2
pkgrel=1
pkgdesc="A comprehensive multivariate independence testing package"
arch=('any')
url="https://github.com/neurodata/hyppo"
license=('MIT')
depends=(
    'python'
    'python-numpy'
    'python-scipy'
    'python-numba'
    'python-scikit-learn'
    'python-autograd'
    'python-statsmodels'
    'python-patsy'
    'python-pandas'
    'python-future'
    'python-joblib'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-pytest: to run the bundled test suite'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4634d15516248a43d25c241ed18beeb79bb3210360f7253693b3f154fe8c9879')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
