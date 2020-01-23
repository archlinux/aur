# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson
_pkgname="${pkgname/python-/}"
pkgver=2.2.0
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64 i686)
url="https://github.com/ijl/orjson"
license=('Apache' 'MIT')

depends=('python')
makedepends=('python-pip' 'rust')

source=("orjson-$pkgver.tar.gz"::"https://github.com/ijl/orjson/archive/$pkgver.tar.gz")
sha512sums=('329c43b6c610ac3738b6a722c49fff6b1586e6653b6298178a17c98c8657fb37761a007b48a21bc270e15f8358819e8d82ec71eaa2140e2439cb5f681ba59a88')

build() {
	cd "$_pkgname-$pkgver"
    rm -f "./*.whl" # remove old wheels

	PIP_CONFIG_FILE=/dev/null pip wheel --isolated --no-binary=orjson .
}

package() {
	cd "$_pkgname-$pkgver"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
