# Maintainer: dragon <drgn@fn.de>

pkgname=python-aiobtclientrpc
_pkgname=${pkgname#python-}
pkgver=5.0.1
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
sha512sums=('e74538c0e56483a908c34d3480874bee14838d3c7e327f81aeef5b9c82c981b7cd1e3c75fb5007e6465ede5599602ded7300603864441db9792dced63f3d5400')


build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf "$pkgdir/usr/lib/python3."*/site-packages/{tests,docs,build}
}
