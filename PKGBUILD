# Maintainer: jhossbach <julian dot hossbach at gmx dot de>
pkgname=python-lsp-ruff
pkgver=2.0.2
pkgrel=1
pkgdesc="python-lsp-server plugin for extensive and fast linting using ruff"
arch=(any)
license=('MIT')
url="https://github.com/python-lsp/python-lsp-ruff"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39c4c8a0c3df935f2f68e0f97fd4fcd02a4a7a620709f8213989116f8d6ac918')
depends=(python-lsp-server 'python-ruff>=0.1.5' python-cattrs python-lsprotocol python-tomli)
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
