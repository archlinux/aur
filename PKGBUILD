# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sanic-testing
pkgver=23.12.0
pkgrel=2
pkgdesc='Core testing clients for Sanic'
arch=("any")
url='https://github.com/sanic-org/sanic-testing/'
license=(MIT)
depends=(python python-httpx)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-sanic python-pytest-asyncio)
source=("https://github.com/sanic-org/sanic-testing/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('427c47577d9eab69e2b51fb6bef027ca076646fd98c58900b18cae4abbaa05be')

build() {
    cd sanic-testing-$pkgver
    python setup.py build
}

check() {
    cd sanic-testing-$pkgver
    python -m pytest
}

package() {
    cd sanic-testing-$pkgver
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
