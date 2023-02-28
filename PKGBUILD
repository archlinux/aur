# Maintainer: jhossbach <julian dot hossbach at gmx dot de>
pkgname=python-lsp-ruff
pkgver=1.1.0
pkgrel=2
pkgdesc="python-lsp-server plugin for extensive and fast linting using ruff"
arch=(any)
license=('MIT')
url="https://github.com/python-lsp/python-lsp-ruff"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed2694f7d9c9af81637c57a1d064812c8760f19b276013fb16e3bf32a17ca772')
depends=(python-lsp-server python-ruff)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/$pkgname-$pkgver"

    # For pytest
    pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
