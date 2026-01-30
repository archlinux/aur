# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=votetracker
pkgver=2.8.0
pkgrel=2
pkgdesc="School grade management application (italian school system)"
arch=('any')
url="https://github.com/mambucodev/votetracker"
license=('MIT')
depends=('python' 'pyside6' 'python-reportlab' 'python-requests' 'python-installer')
makedepends=('python-build' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mambucodev/votetracker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('62fa0114ee0bf5439c02ea0407737464c3beb3b93552b20ff328f227bdfee78c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install .desktop file
    install -Dm644 scripts/votetracker.desktop "$pkgdir/usr/share/applications/votetracker.desktop"
}
