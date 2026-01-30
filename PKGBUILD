# Maintainer: Bill Sideris <bill88t@feline.gr>
pkgname=gpmaster
pkgver=1.0.0
pkgrel=1
pkgdesc="GPG-backed lockbox for secrets management"
arch=('any')
url="https://github.com/bill88t/gpmaster"
license=('GPL3')
depends=('python>=3.8' 'python-gnupg' 'gnupg')
optdepends=('python-pyotp')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/bill88t/gpmaster/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('ad40f60e6c12027de6513082bf515dc6c862a216d84f2536f06ffb2518a93f8e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
