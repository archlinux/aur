# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_pkgname=truststore
pkgname=python-$_pkgname
pkgver=0.8.0
pkgrel=1
pkgdesc='Python library for native system certificate stores (i.e. "trust stores")'
arch=('any')
url='https://github.com/sethmlarson/truststore'
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel python-flit)
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c862292f8d136bfcf2a7827a1fd1c1b27944a982741205fb466005673b570df8')

prepare() {
    cd "$_pkgname-$pkgver"
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
