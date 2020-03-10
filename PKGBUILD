# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson
_pkgname="${pkgname/python-/}"
pkgver=2.6.0
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/ijl/orjson"
license=('Apache' 'MIT')

depends=('python')
makedepends=('python-pip' 'rust')

source=("orjson-$pkgver.tar.gz"::"https://github.com/ijl/orjson/archive/$pkgver.tar.gz")
sha512sums=('2ccba989bfd78a7eb117779a78e953b6134f4022b54abed9f9c3ad1cc6c2879899da9a936ab0bf5254fc5c9805df0a111a07f901f2486ce8e30023fa8e5159ff')

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir" --isolated --ignore-installed --no-deps --no-binary=orjson --use-pep517 .
}
