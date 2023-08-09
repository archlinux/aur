# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_pkgname=truststore
pkgname=python-$_pkgname
pkgver=0.7.0
pkgrel=1
pkgdesc='Python library for native system certificate stores (i.e. "trust stores")'
arch=('any')
url='https://github.com/sethmlarson/truststore'
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel python-flit)
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('649c5379dde57e896323564f8bdd1d0fd193b8ca13f191c492a4d66aac218981')

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
