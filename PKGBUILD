# Maintainer: Bill Sideris <bill88t@feline.gr>
pkgname=gpmaster
pkgver=1.1.0
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
sha256sums=('783e29c5ece9fbe660aea17193e135d4fb62a8d82527f7e48b683c741f2dad4c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 gpmaster-completion.bash
        "$pkgdir/usr/share/bash-completion/completions/gpmaster"
}
