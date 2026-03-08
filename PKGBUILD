# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=python-spotipy
pkgver=2.26.0
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/spotipy-dev/spotipy'
license=('MIT')
depends=(python python-requests python-redis python-urllib3)
makedepends=(python-build python-installer python-setuptools)
optdepends=('python-pymemcache: to cache requests')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/spotipy-dev/spotipy/archive/$pkgver.tar.gz")
b2sums=('28aa615a2692ac7202946dfb30d25bd1e75c570cb68e1d7ed1671a10ae0b0598859c1deeaa44fa2a105112fe7c7171d5041e44c3e317d3331414c6b368af91ee')

build() {
    cd "spotipy-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "spotipy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
