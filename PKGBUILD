# Maintainer: jhossbach <julian dot hossbach at gmx dot de>
pkgname=python-lsp-ruff
pkgver=1.4.0
pkgrel=1
pkgdesc="python-lsp-server plugin for extensive and fast linting using ruff"
arch=(any)
license=('MIT')
url="https://github.com/python-lsp/python-lsp-ruff"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c343d474006176c9991e2e347f7e94ecc747cbd0fc6d9c112ef843b0722b9206')
depends=(python-lsp-server python-ruff python-lsprotocol python-tomli)
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
