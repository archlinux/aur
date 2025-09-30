# Maintainer: jhossbach <julian dot hossbach at gmx dot de>
pkgname=python-lsp-ruff
pkgver=2.3.0
pkgrel=1
pkgdesc="python-lsp-server plugin for extensive and fast linting using ruff"
arch=(any)
license=('MIT')
url="https://github.com/python-lsp/python-lsp-ruff"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('21bb1e014ff466ad7b478ff64920ecfb812df45b06bc802b54102d63cc2ba6bb')
depends=(python-lsp-server 'python-ruff>=0.2.0' python-cattrs python-lsprotocol python-tomli)
makedepends=(python-build python-installer python-wheel python-setuptools)
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
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
