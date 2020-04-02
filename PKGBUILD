# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson
_pkgname="${pkgname/python-/}"
pkgver=2.6.3
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/ijl/orjson"
license=('Apache' 'MIT')

depends=('python')
makedepends=('python-pip' 'rust')

source=("orjson-$pkgver.tar.gz"::"https://github.com/ijl/orjson/archive/$pkgver.tar.gz")
sha512sums=('3ec506f63be863192eef1f2027a12a2ac7e04ded9b386cd7b2ae2614223dc972c694053c31e3bbdac78b8224bcdfc6b0f3cd6071d1ae17bf40f54bec3ca3e050')

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir" --isolated --ignore-installed --no-deps --no-binary=orjson --use-pep517 .
}
