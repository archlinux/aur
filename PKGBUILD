# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=votetracker
pkgver=2.8.2
pkgrel=1
pkgdesc="School grade management application (italian school system)"
arch=('any')
url="https://github.com/mambucodev/votetracker"
license=('MIT')
depends=('python' 'pyside6' 'python-reportlab' 'python-requests' 'python-installer')
makedepends=('python-build' 'python-setuptools' 'python-wheel')
optdepends=('python-lxml: Axios Italia electronic register integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mambucodev/votetracker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9f9dc4b9653b6b921a26b69242e2485a998e422af5cc880d6290d04698d24790')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install .desktop file
    install -Dm644 scripts/votetracker.desktop "$pkgdir/usr/share/applications/votetracker.desktop"

    # Install icons
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "icons/icon-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/votetracker.png"
    done
}
