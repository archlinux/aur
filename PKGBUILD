# Maintainer:  
# Contributor: Michael Riegert <michael at eowyn net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-pychromecast6
_name=pychromecast
pkgver=6.0.1
pkgrel=5
pkgdesc='Library for Python 3 to communicate with the Google Chromecast (legacy v6 release)'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=(
    'python'
    'python-casttube'
    'python-protobuf'
    'python-requests'
    'python-zeroconf'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
conflicts=('python-pychromecast')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz"
        "is_alive.patch")
sha512sums=('f4b881a559e89d7eb81487ce44c13ac707831a731d348418a78d4786a559abb3c6e98c6b1aa762ad14e5c4461de9a7254ce68c7543bb80e30ce4c3af08d7b24e'
            'bfe81d4de9011084046a487ba76cb6bc2d70fd7e7eeeaf9de45d0454353bcfd974c1df494ebb286d0438d4a6534101a83da8d95d2333af4b5d45b45f56f9aa3a')

prepare() {
    cd "$_name-$pkgver"
    patch -p0 -i ../is_alive.patch
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
