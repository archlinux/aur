# Maintainer: Bill Sideris <bill88t@feline.gr>
pkgname=gpmaster
pkgver=1.2.1
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
sha256sums=('c50dc12cc223b5969dc41958ec221d40f51ad4e1bba34a1fce43d65cdad73e3f')

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
