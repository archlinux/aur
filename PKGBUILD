# Maintainer: le0kar0ub1 <archlinux.navigator607@passmail.net>
pkgname=cellar
pkgver=0.1.0
pkgrel=1
pkgdesc="Enforce an aging period on AUR package upgrades"
arch=('any')
url="https://github.com/le0kar0ub1/Cellar"
license=('MIT')
depends=('python' 'pacman')
optdepends=('paru: preferred AUR helper for cellar upgrade'
            'yay: alternative AUR helper for cellar upgrade')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8cd33d26466bd4bc436e881a623788866d2bc6b30802376a1ea1433465387435')

build() {
    cd "Cellar-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "Cellar-$pkgver"
    python -m unittest discover -s tests
}

package() {
    cd "Cellar-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
