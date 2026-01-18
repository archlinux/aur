# Maintainer: dragon <drgn@fn.de>

pkgname=python-aiobtclientapi
_pkgname=${pkgname#python-}
pkgver=1.1.4
pkgrel=1
pkgdesc='Asynchronous high-level communication with BitTorrent clients'
arch=('any')
url="https://codeberg.org/plotski/aiobtclientapi"
license=('GPL-3.0-only')
depends=(python python-{aiobtclientrpc,async-timeout,httpx,torf})
makedepends=(git python-{build,installer,wheel,setuptools})
source=("git+$url#tag=v$pkgver")
sha512sums=('e78451b4358bf05c7649645d0c79a747f5a41cd443d271aa38349961fdf75ac25b32e251a5417d3069fee13147e0aeeb76ad5ed93d4684e01681440417cdd1e1')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir/usr/lib/python3."*/site-packages/{tests,docs,build}
}
