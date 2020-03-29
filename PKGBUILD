# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson
_pkgname="${pkgname/python-/}"
pkgver=2.6.2
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/ijl/orjson"
license=('Apache' 'MIT')

depends=('python')
makedepends=('python-pip' 'rust')

source=("orjson-$pkgver.tar.gz"::"https://github.com/ijl/orjson/archive/$pkgver.tar.gz")
sha512sums=('b728b50748f86fb286b0858ca698782c8ec9be928df0114c3eb295b0e30faefe64b47e48a0d52a0d9dfc602951e48d77716be18b84579b6b5f32c681b30a87c8')

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir" --isolated --ignore-installed --no-deps --no-binary=orjson --use-pep517 .
}
