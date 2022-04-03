# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-yfinance
_name=${pkgname#python-}
pkgver=0.1.70
pkgrel=2
pkgdesc="Yahoo! Finance market data downloader (+faster Pandas Datareader)"
arch=('x86_64')
url="https://github.com/ranaroussi/yfinance"
license=('Apache')
depends=(
    'python-numpy'
    'python-pandas'
    'python-requests'
    'python-lxml'
    'python-multitasking'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/ranaroussi/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9706e000a068db92d5f9d0b0c4d4d12b0abd87702de39c584eeb6f5f706941d0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
