# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-ema-pytorch
pkgver=0.8.3
pkgrel=1
pkgdesc="Exponential moving averages for PyTorch models and tensor trees"
arch=('any')
url="https://github.com/lucidrains/ema-pytorch"
license=('MIT')
_commit=762c471c221c50b770c3ba10274e6b5b08d15a7b
depends=('python' 'python-numpy' 'python-pytorch>=2.0')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('c9135990a6e7c3312497b1849731cb3b068fecde088e08b83f3f53d16bf924a4')

build() {
    cd "ema-pytorch-$_commit"
    python -m build --wheel --no-isolation
}

check() {
    cd "ema-pytorch-$_commit"
    python -m pytest -v tests --junitxml="$srcdir/pytest-results.xml"
}

package() {
    cd "ema-pytorch-$_commit"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
