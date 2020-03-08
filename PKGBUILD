# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson
_pkgname="${pkgname/python-/}"
pkgver=2.5.2
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/ijl/orjson"
license=('Apache' 'MIT')

depends=('python')
makedepends=('python-pip' 'rust')

source=("orjson-$pkgver.tar.gz"::"https://github.com/ijl/orjson/archive/$pkgver.tar.gz")
sha512sums=('f4be9c5ea00381b69332cea24cf423be3628acd01c935b2bdc3ee7afbd9276e11494fd1dd1bd25f00968d5186390cc7709f6518096546dae515559c7e975435b')

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir" --isolated --ignore-installed --no-deps --no-binary=orjson --use-pep517 .
}
