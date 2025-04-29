# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-yfinance
_name=${pkgname#python-}
pkgver=0.2.57
pkgrel=1
pkgdesc="Yahoo! Finance market data downloader (+faster Pandas Datareader)"
arch=(any)
url=https://github.com/ranaroussi/yfinance
license=(Apache-2.0)
depends=(
    python-beautifulsoup4
    python-frozendict
    python-multitasking
    python-numpy
    python-pandas
    python-peewee
    python-platformdirs
    python-pytz
    python-requests
    python-requests-cache
)
optdepends=(
    'python-pandas-datareader: to use pandas_datareader'
    'python-scipy: repair'
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=($_name-$pkgver.tar.gz::https://github.com/ranaroussi/$_name/archive/refs/tags/$pkgver.tar.gz)
b2sums=('f3bf3a272a66ddba5923d2feeecbbae1d456d6ae3ca2d92b9258e783b5f47462be558aeb2b51d9bbb642a91330ac18437d75d496ff3861b06024630b9e9ba435')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Remove weird entry point
    rm -rf "$pkgdir"/usr/bin
}
