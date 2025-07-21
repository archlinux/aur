# Contributor: Mubashshir <ahmubashshir@gmail.com>

_name=urlmatch
pkgname=python-urlmatch
pkgver=1.0.1
pkgrel=2
pkgdesc='Library for easily pattern matching wildcard URLs'
arch=(any)
url=https://github.com/jessepollak/urlmatch
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
	"fix-deprecations.patch")
sha256sums=('0368322e54927683a25a469105f619ed7d69647f5ca10066421325cc5fcd1518'
            '10757412061ed7e1a3cae2eef0f688cbe8a3cf16806f063593f1111c8c33cbab')

prepare() {
    cd "$_name-$pkgver"
    patch -p1 < ../fix-deprecations.patch
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    python -m unittest tests/urlmatch_test.py
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
