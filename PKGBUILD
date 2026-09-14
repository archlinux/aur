# Maintainer: zyekhabdul <zyekhabdulqadirjailani@gmail.com>
pkgname=agy-quota
pkgver=1.2.1
pkgrel=1
pkgdesc="Antigravity Multi-Account Token, Quota & Tier Bulk Checker"
arch=('any')
url="https://github.com/zyekhabdul/agy-quota"
license=('MIT')
depends=('python' 'python-cryptography' 'python-rich')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('67629a73dedee450a4b829b82248faf14933930cbf5239e2b9265eaad282409a')

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
