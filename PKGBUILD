# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-yfinance
_name=${pkgname#python-}
pkgver=0.2.56
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
b2sums=('0daee0ebe3885b114272c26875d873ca04bbd93bf2448832b4ba26b7ce382d5b1713854404a426752444bd5a00835fd2536eb4c0666654c2d2fea64af32cdcad')

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
