# Maintainer: mrbooo895 | kwkkna3@gmail.com

pkgname=python-pyinit
pkgver=1.0.13
pkgrel=1
pkgdesc="A powerful CLI tool for creating and managing the entire lifecycle of Python projects."
arch=('any')
url="https://github.com/mrbooo895/pyinit"
license=('MIT')
depends=('python' 'python-rich' 'python-tomli' 'python-tomli-w' 'python-importlib-resources' 'git')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-packaging')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('48d8f439fdaad63a46952e6dbc1a69195543d6b32ed193b7e527e07aba64999c')
build() {
    cd "pyinit-$pkgver"
    python -m build --wheel --sdist --no-isolation
}

package() {
    cd "pyinit-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/share/pyinit"
    install -Dm644 "src/pyinit/_templates/pyproject.toml" "$pkgdir/usr/share/pyinit/pyproject.toml"
}
