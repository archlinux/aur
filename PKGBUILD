# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=mkwhl
pkgver=0.3.1
pkgrel=1
pkgdesc="Python wheel creation utility"
url="https://github.com/bozokopic/mkwhl"
license=('GPL3')
arch=('any')
depends=('python-packaging' 'python-tomli')
makedepends=('python-build' 'python-installer')
source=("https://github.com/bozokopic/mkwhl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('939a57155662a0242fec72bd02639b207bc618b5720271c209440c00d258a97b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
