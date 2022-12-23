# Maintainer: jhossbach <julian dot hossbach at gmx dot de>
pkgname=python-lsp-ruff
pkgver=1.0.3
pkgrel=1
pkgdesc="python-lsp-server plugin for extensive and fast linting using ruff"
arch=(any)
license=('MIT')
url="https://github.com/python-lsp/python-lsp-ruff"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9876fe4977eba8bccd4495793b6f732b80d3823b1043344c4340eff02fe15b2')
depends=(python-lsp-server ruff)
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
