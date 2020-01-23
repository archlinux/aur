# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson-git
pkgver=2.2.0.r0.g95a03b0
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes (Git version)"
arch=(x86_64 i686)
url="https://github.com/ijl/orjson"
license=('Apache' 'MIT')

provides=('python-orjson')
conflicts=('python-orjson')

depends=('python')
makedepends=('git' 'python-pip' 'rust')

source=("git+https://github.com/ijl/orjson.git")
sha512sums=('SKIP')

pkgver() {
    cd orjson
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd orjson
    rm -f "./*.whl" # remove old wheels

	PIP_CONFIG_FILE=/dev/null pip wheel --isolated --no-binary=orjson .
}

package() {
	cd orjson
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
