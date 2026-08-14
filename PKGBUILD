# Maintainer: dragon <drgn@fn.de>

pkgname=python-aiobtclientrpc
_pkgname=${pkgname#python-}
pkgver=6.0.1
pkgrel=1
pkgdesc='Asynchronous low-level communication with BitTorrent clients'
arch=('any')
url="https://codeberg.org/plotski/aiobtclientrpc"
license=('GPL-3.0-only')
depends=(
	python
	python-async-timeout
	python-httpx
	python-httpx-socks
	python-python-socks
	python-rencode
)
makedepends=(git python-{build,installer,wheel,setuptools})
source=("git+$url#tag=v$pkgver")
sha512sums=('ef3a9f7fca215d76419a18666fd0cdbdb892482e1b3663e17dd59dd1f418d2b6258938f63482352feeac506ff91dcabceb8db8a8c2138870da4cee84ba9632ac')


build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf "$pkgdir/usr/lib/python3."*/site-packages/{tests,docs,build}
}
