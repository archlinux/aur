# Maintainer: zyekhabdul <zyekhabdulqadirjailani@gmail.com>
pkgname=agy-quota
pkgver=1.2.0
pkgrel=1
pkgdesc="Antigravity Multi-Account Token, Quota & Tier Bulk Checker"
arch=('any')
url="https://github.com/zyekhabdul/agy-quota"
license=('MIT')
depends=('python' 'python-cryptography' 'python-rich')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1b0df9352e34c58a8c250c0f18204fbfe44312c2fd21f1b2d1266e2157889bc')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    ln -sf agy-quota "$pkgdir/usr/bin/agy-tokens"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
