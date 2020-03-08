# Maintainer: gmes78 <gmes.078 at gmail dot com>

# NOTE: building this package requires a nightly build of the Rust compiler.

pkgname=python-orjson-git
pkgver=2.5.2.r1.gd31e37b
pkgrel=1
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes (Git version)"
arch=(x86_64 i686 aarch64 armv7h)
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

package() {
	cd orjson
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

	PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir" --isolated --ignore-installed --no-deps --no-binary=orjson --use-pep517 .
}
