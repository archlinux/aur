# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson
_pkgname="${pkgname/python-/}"
pkgver=2.5.1
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64 i686)
url="https://github.com/ijl/orjson"
license=('Apache' 'MIT')

depends=('python')
makedepends=('python-pip' 'rust')

source=("orjson-$pkgver.tar.gz"::"https://github.com/ijl/orjson/archive/$pkgver.tar.gz")
sha512sums=('6e95ea4fb18515785b24065f3bf3b5b4bef97c24d7abeb76a9052c755132d67954051619cdabdf943e89efaf5f7891ef01436d8557caaa040fd0bcbf543753cb')

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
