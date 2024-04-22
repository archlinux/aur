# Maintainer: Joaquim Monteiro <joaquim dot monteiro at protonmail dot com>

pkgname=python-orjson-git
pkgver=3.10.1.r0.g632345a
pkgrel=2
pkgdesc="Fast, correct Python JSON library supporting dataclasses and datetimes (Git version)"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/ijl/orjson"
license=('Apache-2.0' 'MIT')

provides=('python-orjson')
conflicts=('python-orjson')

depends=('python')
makedepends=('git' 'python-installer' 'python-maturin' 'rust')

source=("git+https://github.com/ijl/orjson.git")
sha512sums=('SKIP')

pkgver() {
    cd orjson
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd orjson
    maturin build --release --strip
}

package() {
	cd orjson
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl
}
