# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-azure-data-tables
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=12.6.0
pkgrel=1
pkgdesc="Microsoft Corporation Azure Data Tables Client Library for Python"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://pypi.org/project/azure-data-tables"
_pydeps=(
    isodate
    azure-core
    typing_extensions
    yarl
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=()
license=('MIT')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/$_name-$pkgver.tar.gz")
sha256sums=('e0d5598113855f9114fd7671623d35509f83772970cfdc597901b35f42dc3134')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
