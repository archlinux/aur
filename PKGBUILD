# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=shazamio-core
pkgname=python-$_name
pkgver=1.0.7
pkgrel=1
pkgdesc='Core of python-shazamio'
arch=('any')
url='https://github.com/shazamio/shazamio-core'
license=('MIT')
depends=('alsa-lib' 'python>=3.8')
makedepends=(python-build python-installer python-maturin python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('65f1827ab6bd02724528155959a7cf01a0713f9e9d1e2a938dce9a74e94881272444eb407462f5160df90549d81f576cf05c71603557ed61c8b95e104bc3f66a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
